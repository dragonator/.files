##############################################################
##                      Miscellaneous                       ##
##############################################################
# Set "**" to match all files and zero or more (sub)directories
shopt -s globstar

##############################################################
##                   Internal Variables                     ##
##############################################################
# Path to code directory
CODE_DIR="$HOME/code"

##############################################################
##                     Bash Completions                     ##
##############################################################
# Complete $CODE_DIR directory entries
__code_complete() {
  local cur=$(join_by / "${COMP_WORDS[@]}" | sed -e 's/code\///')
  COMPREPLY=( $(compgen -d "$CODE_DIR/$cur" | sed -e 's,'".*/"',,'))
}

complete -F __code_complete code

##############################################################
##                        Functions                         ##
##############################################################
# Used internally in bash completion functions
function join_by()      { local IFS="$1"; shift; echo "$*" ; }

# Go to code/<subdirectory>
function code()         { cd "$CODE_DIR/$(join_by / "$@")" ; }

# RPM extraction
function xrpm()         { rpm2cpio "$1" | cpio -idmv       ; }

# Remove duplicated entries in PATH
function sanitize_path() {
  if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
      x=${old_PATH%%:*}     # the first remaining entry
      case $PATH: in
        *:"$x":*) ;;        # already there
        *) PATH=$PATH:$x;;  # not there yet
      esac
      old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
  fi
}
