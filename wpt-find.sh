function wpt-find() {
  (
    cwd=$(pwd)

    # Config - change any of these values to match your preferred setup
    local directory="${WPT_FIND_DIRECTORY}" # the local `wpt` checkout path
    # Check if the directory env variable is defined
    if [ -z "$directory" ]; then
      echo "WPT_FIND_DIRECTORY is not defined. Please set the WPT_FIND_DIRECTORY environment variable."
      return 1
    fi
    # Check if the directory exists
    if [ ! -d "$directory" ]; then
      echo "Directory $directory does not exist."
      return 1
    fi
    # Check if the directory is a git repository
    if [ ! -d "$directory/.git" ]; then
      echo "Directory $directory is not a git repository."
      return 1
    fi
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
    local color_gray_light='\033[38;5;250m'
    local color_purple='\033[0;35m'
    # Contextual colors
    local color_none='\033[0m'   # Default text color
    local color_base=$color_cyan # Result text color
    local color_link=$color_gray # Result link color (used in markdown)
    local color_line=$color_gray # Neutral gray for separators
    local color_success=$color_green
    local color_error=$color_red
    # Font weight
    local font_bold='\e[1m'
    local font_normal='\e[0m'

    local usage_string="Usage: $(basename $0) [-m|--markdown] [-l|--list] [-t|--title] [-r|--regex] [-c|--copy] \"[searchterm]\""

    local spinner=( '⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏' )

    spin() {
      local spin_text=$1
      tput civis
      stty -echo < /dev/tty
      local i=0
      local j=0
      while [ 1 ]
      do 
        for j in ${spinner[@]}; 
        do 
          local message="${color_cyan}$j${color_none} ${spin_text} ${color_gray}(Ctrl+C to cancel)${color_none}\n"
          local prefix=""
          if [ $i -gt 0 ]; then
            prefix="\r\033[2K\033[1A\r\033[2K"
          fi
          echo -ne "$prefix$message"
          sleep 0.05
          ((i++))
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
      echo -ne "\r\n${color_error}✘${color_none} Search interrupted\n"
      exit 1
    }

    start_spin() {
      echo -ne "\n"
      spin "$1" & pid=$!
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

    # Print script nicename
    echo -ne "\n${color_cyan}${font_bold}wpt-find${font_normal}${color_none} - Search the web-platform-tests repository\n  ${color_gray_light}╷\n"

    # Flags and corresponding names
    local flags=("m" "l" "t" "r" "c")
    local flag_names=("markdown" "list" "title" "regex" "copy")
    declare -a local_flags=()
    declare -a env_flags=()

    fill_flags() {
      local flag=$1
      local flag_value=$2
      local env_var=$3

      if [ $flag_value -eq 1 ]; then
        local flag_name=""
        local index=0
        while [ $index -le ${#flags[@]} ]; do
          if [ "${flags[$index]}" = "$flag" ]; then
            flag_name="${flag_names[$index]}"
            if [ -z "$env_var" ]; then
              # Append to local flags
              local_flags+=("${flag_name}")
            else
              # Append to env flags
              env_flags+=("${flag_name}")
            fi
          fi
          ((index++))
        done
      fi
    }

    print_flags() {
      if [ ${#local_flags[@]} -ne 0 ] || [ ${#env_flags[@]} -ne 0 ]; then
        echo -n "${color_gray_light}  ├─ ${font_bold}Flags enabled: ${font_normal}"
        if [ ${#local_flags[@]} -ne 0 ]; then
          local_flags_str="${local_flags[@]}"
          local_flags_str="${local_flags_str// /, }"
          local_flags_str="${local_flags_str%,}"
          printf "${color_gray_light}%s ${color_none}" "$local_flags_str"

          # Check if there are environment flags. If so, print (local)
          if [ ${#env_flags[@]} -ne 0 ]; then
            echo -n "${color_gray_light}(${color_none}${font_bold}local${font_normal}${color_gray_light})"
          fi
        fi
        if [ ${#env_flags[@]} -ne 0 ]; then
          if [ ${#local_flags[@]} -ne 0 ]; then
            echo -n " | "
          fi
          env_flags_str="${env_flags[@]}"
          env_flags_str="${env_flags_str// /, }"
          env_flags_str="${env_flags_str%,}"
          printf "${color_gray_light}%s ${color_none}" "$env_flags_str"
          echo -n "${color_gray_light}(${color_none}${font_bold}env${font_normal}${color_gray_light})"
        fi
        echo
      fi
    }

    fill_flags "m" $md "$WPT_FIND_MARKDOWN"
    fill_flags "l" $list "$WPT_FIND_LIST"
    fill_flags "t" $title "$WPT_FIND_TITLE"
    fill_flags "r" $regex "$WPT_FIND_REGEX"
    fill_flags "c" $clipboard "$WPT_FIND_CLIPBOARD"
    print_flags

    # Fetch and display the commit hash and the date of the last commit
    cd "${directory}"
    local last_commit_hash=$(git log -1 --format="%h")
    local last_commit_date=$(git log -1 --format="%cd")
    echo "${color_gray_light}  └─ ${font_bold}Last commit:${font_normal} ${color_purple}$last_commit_hash${color_gray_light} on $last_commit_date${color_none}"

    # Start search
    start_spin "Searching"
    cd "${directory}"
    if [ $regex -eq 1 ]; then
      local results=($(grep -ElR "$1" | grep ".html$" | grep -v "[-]ref.html$" | sed -e "s,^\.,https://wpt.fyi,"))
      sleep 4
    else
      local results=($(grep -F -lR "$1" | grep ".html$" | grep -v "[-]ref.html$" | sed -e "s,^\.,https://wpt.fyi,"))
      sleep 4
    fi
    stop_spin

    # Process any results
    start_spin "Processing results"
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

      # Print results
      stop_spin
      echo -ne "\r\n${color_success}✔${color_none} Search complete\n\n"
      local line_separator=$(printf "${color_line}%*s${color_none}\n" "$columns" '' | tr ' ' ─)
      echo -e "$line_separator\n$print_string\n$line_separator\n"
      echo "Found ${count} tests related to your search term ${color_purple}$1${color_none}"
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
