  # Function to check if all arguments are options
  function all_options() {
    for arg in "$@"; do
      if [[ ! $arg == -* ]]; then
        return 1
      fi
    done
    return 0
  }

function edit() {
  if [[ $# -gt 0 && $(all_options "$@") -eq 0 ]]; then
    $EDITOR $@
  else
    # Get the last argument of the previous command
    prev_arg=${(z)$(fc -ln -1 | awk '{print $NF}')}

    # Check if the last argument is a valid path and a text file
    if [[ -e $prev_arg && $(file --mime-type -b "$prev_arg") == text/* ]]; then
      $EDITOR $@ "$prev_arg"
    else
      $EDITOR $@
    fi
  fi
}

function gita() {
    local cmd=(git add)
  if [[ $# -gt 0 && $(all_options "$@") -eq 1 ]]; then
    $cmd $@
  else
    # Get the last argument of the previous command
    prev_arg=${(z)$(fc -ln -1 | awk '{print $NF}')}

    if [[ -e $prev_arg ]]; then
      $cmd $@ "$prev_arg"
    else
      $cmd $@
    fi
  fi
}

function gitc() {
    local last_cmd=$(fc -ln -1)
    if [[ $last_cmd != "gita"* && $last_cmd != "git add"* && $last_cmd != "addp"* ]]; then
        gita
    fi
    if [[ $# -eq 0 ]]; then
        git commit --amend
    elif [[ $# -eq 1 ]]; then
        git commit -m "$1"
    elif [[ $# -gt 1 ]]; then
        local msg=""
        local files=()
        local extra_args=()

        while [[ $# -gt 0 ]]; do
            case $1 in
                -m | --message)
                    shift
                    msg="$1"
                    if [[ -z $msg ]]; then
                        echo "error: no commit message provided"
                        return 1
                    fi
                ;;
                -*)
                    extra_args+=("$1")
                ;;
                *) files+=("$1");;
            esac
            shift
        done

        gita "${files[@]}"
        git commit -m "$msg" "${extra_args[@]}"
    else
        echo "ARE YOU AN IDIOT??"
        type -f gitc
        return 1
    fi
}
