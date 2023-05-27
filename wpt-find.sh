function wpt-find() {
  cwd=$(pwd)

  # Config - change any of these values to match your preferred setup
  local directory="/wpt" # Replace this with your local `wpt` checkout path
  local md=0
  local list=0
  local clipboard=0
  local green='\033[0;32m'  # Results text color
  local blue='\033[0;34m'  # Results links color (when rendering markdown)
  local nc='\033[0m'  # Default text color

  local usage_string="Usage: $(basename $0) [-m|--markdown] [-l|--list] [-c|--copy] \"[searchterm]\""

  # Handling long-form arguments
  for arg in "$@"
  do
    shift
    case "$arg" in
      "--markdown") set -- "$@" "-m" ;;
      "--list") set -- "$@" "-l" ;;
      "--copy") set -- "$@" "-c" ;;
      *) set -- "$@" "$arg"
    esac
  done

  while getopts 'mlc' OPTION; do
    case "$OPTION" in 
      m) 
        md=1
        ;;
      l)
        list=1
        ;;
      c)
        clipboard=1
        ;;
      ?) 
        echo "\n${usage_string}"
        return 1
        ;;
    esac
  done
  shift $(( OPTIND - 1 ))

  if [ -z "$1" ]; then
    echo "Please provide a search string or regex pattern.\n\n${usage_string}"
    return 1
  fi

  cd "${directory}"
  echo "Searching...\n"
  local results=($(grep -ElR "$1" | grep -v "[-]ref.html$" | sed -e "s,^\.,https://wpt.fyi,"))
  local filtered_results=()
  local link_prefix="https://wpt.fyi"
  local output_string=""
  local print_string=""
  for item in "${results[@]}"; do
    if [[ $item == *"$link_prefix"* ]]; then
      filtered_results+=($item)
    fi
  done

  local columns=${COLUMNS}
  if ! [[ $columns =~ ^[0-9]+$ ]]; then
    columns=$(tput cols)
  fi

  local index=0
  local result_count=${#filtered_results[*]}
  if [ $result_count -gt 0 ]; then
    printf '%*s\n' "$columns" '' | tr ' ' -
    for item in "${filtered_results[@]}"; do
      local print_prefix=""
      [[ $list -eq 1 ]] && print_prefix="- "
      local print_link="${item}"
      local abbr_link="${print_link#$link_prefix}"
      if [[ $md -eq 1 ]]; then
        output_string+="${print_prefix}[${abbr_link}](${print_link})"
        print_link="${print_prefix}${nc}[${green}${abbr_link}${nc}](${blue}${print_link}${nc})"
      else
        output_string+="${print_prefix}${print_link}"
        print_link="${print_prefix}${green}${print_link}${nc}"
      fi
      print_string+="${print_link}"
      if [[ "$index" -ne $((result_count - 1)) ]]; then
        output_string+="\n"
        print_string+="\n"
      fi
      index=$((index + 1))
    done
    echo -e "${print_string}"
    printf '%*s\n' "$columns" '' | tr ' ' -
    echo "\nFound ${result_count} tests related to your search term \"$1\""
    if [[ $clipboard -eq 1 ]]; then 
      local clipboard_msg="\nResults have been copied to your clipboard."
      if command -v pbcopy > /dev/null; then
        echo -n "$output_string" | pbcopy
        echo "$clipboard_msg"
      elif command -v xclip > /dev/null; then
        echo -n "$output_string" | xclip -selection clipboard
        echo "$clipboard_msg"
      elif command -v clip > /dev/null; then
        echo -n "$output_string" | clip
        echo "$clipboard_msg"
      else
        echo "Could not copy to the clipboard. Please install 'pbcopy' (macOS), 'xclip' (Linux), or 'clip' (Windows) to enable this feature."
      fi
    fi
  else
    echo "No tests found. Try refining your search."
  fi
  cd $cwd
  return 0
}
