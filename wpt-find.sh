function wpt-find(){
  cwd=$(pwd)
  local md=0
  local list=0
  while getopts 'ml' OPTION; do
    case "$OPTION" in 
      m) 
        md=1
        ;;
      l)
        list=1
        ;;
      ?) 
        echo "\nUsage: [-m] [-l] $(basename $0)"
        return 1
        ;;
    esac
  done
  shift $(( OPTIND - 1 ))

  if [ $# -eq 0 ]; then
    echo "No search term provided provided\n\nUsage: [-m] [-l] <SEARCH_TERM>"
    return 1
  fi

  cd "/wpt"
  echo "Searching...\n"
  local results=($(grep -lR $1 | grep -v "[-]ref.html$" | sed -e "s,^\.,https://wpt.fyi,"))
  local filtered_results=()
  local link_prefix="https://wpt.fyi"
  for item in "${results[@]}"; do
    if [[ $item == *"$link_prefix"* ]]; then
      filtered_results+=($item)
    fi
  done

  if [ ${#filtered_results[*]} -gt 0 ]; then
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    for item in "${filtered_results[@]}"; do
      local print_prefix=""
      [[ $list -eq 1 ]] && print_prefix=" - "
      local print_link="${item}"
      local abbr_link="${item#$link_prefix}"
      [[ $md -eq 1 ]] && print_link="[${abbr_link}](${item})"
      echo "${print_prefix}${print_link}"
    done
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
    echo "\nFound ${#filtered_results[*]} tests related to your search term \"$1\""
  else
    echo "No tests found. Try refining your search."
  fi
  cd $cwd
  return 0
}