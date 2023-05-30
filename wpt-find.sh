function wpt-find() {
  (
    cwd=$(pwd)

    # Config - change any of these values to match your preferred setup
    local directory="${WPT_FIND_DIRECTORY:-/wpt}" # the local `wpt` checkout path
    local md="${WPT_FIND_MARKDOWN:-0}"
    local list="${WPT_FIND_LIST:-0}"
    local title="${WPT_FIND_TITLE:-0}"
    local regex="${WPT_FIND_REGEX:-0}"
    local clipboard="${WPT_FIND_CLIPBOARD:-0}"

    # Colors
    local color_green='\033[0;32m'
    local color_red='\033[0;31m'
    local color_cyan='\033[38;5;37m'
    local color_gray='\033[38;5;240m'
    # Contextual colors
    local color_none='\033[0m'   # Default text color
    local color_base=$color_cyan # Result text color
    local color_link=$color_gray # Result link color (used in markdown)
    local color_line=$color_gray # Neutral gray for separators
    local color_success=$color_green
    local color_error=$color_red

    local usage_string="Usage: $(basename $0) [-m|--markdown] [-l|--list] [-t|--title] [-r|--regex] [-c|--copy] \"[searchterm]\""

    local spinner=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )

    spin() {
      tput civis
      stty -echo < /dev/tty
      while [[ 1 ]]
      do 
        for i in ${spinner[@]}; 
        do 
          echo -ne "\033[2K\033[1A\033[2K\033[1A\r${color_cyan}$i${color_none} Searching ${color_gray}(Ctrl+C to cancel)${color_none}\n"
          sleep 0.05
        done
      done
    }

    local pid=""
    trap cleanup INT

    cleanup() {
      if [ ! -z "$pid" ]; then
        stop_spin
      fi
      tput cnorm
      stty echo < /dev/tty
      echo -ne "\r${color_error}✘${color_none} Search interrupted\n"
      exit 1
    }

    start_spin() {
      spin & pid=$!
    }

    stop_spin() {
      kill -9 $pid
      pid=""
      echo -ne "\033[2K\033[1A\033[2K\033[1A"
    }

    # Handling long-form arguments
    for arg in "$@"
    do
      shift
      case "$arg" in
        "--markdown") set -- "$@" "-m" ;;
        "--list") set -- "$@" "-l" ;;
        "--title") set -- "$@" "-t" ;;
        "--copy") set -- "$@" "-c" ;;
        "--regex") set -- "$@" "-r" ;;
        *) set -- "$@" "$arg"
      esac
    done

    while getopts 'mltrc' OPTION; do
      case "$OPTION" in 
        m) 
          md=1
          ;;
        l)
          list=1
          ;;
        t)
          title=1
          ;;
        r)
          regex=1
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

    start_spin
    cd "${directory}"

    if [ $regex -eq 1 ]; then
      local results=($(grep -ElR "$1" | grep ".html$" | grep -v "[-]ref.html$" | sed -e "s,^\.,https://wpt.fyi,"))
      sleep 4
    else
      local results=($(grep -F -lR "$1" | grep ".html$" | grep -v "[-]ref.html$" | sed -e "s,^\.,https://wpt.fyi,"))
      sleep 4
    fi
    stop_spin
    echo -ne "\r${color_success}✔${color_none} Search complete\n\n"
    local filtered_results=()
    local link_prefix="https://wpt.fyi"
    local copy_string=""
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
    local count=${#filtered_results[*]}
    if [ $count -gt 0 ]; then
      for item in "${filtered_results[@]}"; do
        local list_prefix=""
        [[ $list -eq 1 ]] && list_prefix="- "
        local print_link="${item}"
        local abbr_link="${print_link#$link_prefix}"
        if [[ $md -eq 1 ]]; then
          if [[ $title -eq 1 ]]; then
            local html_path="${directory}${abbr_link}"
            local title_text=$(sed -n -e 's|^.*<title>\(.*\)</title>.*$|\1|p' "$html_path")
            title_text=$(echo "$title_text" | tr -d '\n' | awk '{$1=$1};1' | tr -s " ")
            [[ -z "$title_text" ]] && title_text="$abbr_link"
            copy_string+="${list_prefix}[${title_text}](${print_link})"
            print_link="${list_prefix}${color_none}[${color_base}${title_text}${color_none}](${color_link}${print_link}${color_none})"
          else
            copy_string+="${list_prefix}[${abbr_link}](${print_link})"
            print_link="${list_prefix}${color_none}[${color_base}${abbr_link}${color_none}](${color_link}${print_link}${color_none})"
          fi
        else
          copy_string+="${list_prefix}${print_link}"
          print_link="${list_prefix}${color_base}${print_link}${color_none}"
        fi
        print_string+="${print_link}"
        if [[ "$index" -ne $((count - 1)) ]]; then
          copy_string+="\n"
          print_string+="\n"
        fi
        index=$((index + 1))
      done
      local line_separator=$(printf "${color_line}%*s${color_none}\n" "$columns" '' | tr ' ' ─)
      echo -e "$line_separator\n$print_string\n$line_separator\n"
      echo "Found ${count} tests related to your search term \"$1\""
      if [[ $clipboard -eq 1 ]]; then 
        local clipboard_msg="\nResults have been copied to your clipboard."
        if command -v pbcopy > /dev/null; then
          echo -n "$copy_string" | pbcopy
          echo "$clipboard_msg"
        elif command -v xclip > /dev/null; then
          echo -n "$copy_string" | xclip -selection clipboard
          echo "$clipboard_msg"
        elif command -v clip > /dev/null; then
          echo -n "$copy_string" | clip
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
  )
}
