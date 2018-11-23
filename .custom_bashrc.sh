#!/bin/bash
##############################################################
##                   Customize bash                         ##
##############################################################
# Adjust the title with the current directory
export MY_XTITLE=1

##############################################################
##                   Internal Variables                     ##
##############################################################
# Path to code directory
CODE_DIR="$HOME/code"

##############################################################
##                    Export Variables                      ##
##############################################################
# Turn off python byte code (*.pyc)
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING="UTF-8"

# Enable UTF-8 support in Gnome Terminal
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.utf8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Set vim as default editor
export EDITOR=vim

# Add custom tools to path
export PATH=$HOME/bin:$PATH

# Set default terminal
export TERM=xterm-256color

##############################################################
##                         Aliases                          ##
##############################################################
alias tree='tree -a --dirsfirst -I .git'
alias grep='grep --color -n'
alias ls='ls --color'
alias ll='ls -ltrh'
alias la='ll -a'
alias lla='la'
alias google='googler'
alias .files='cd ~/.files'
alias .f='.files'

##############################################################
##                          Others                          ##
##############################################################
# Set "**" to match all files and zero or more directories and subdirectories.
shopt -s globstar

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
function join_by()      { local IFS="$1"; shift; echo "$*" ; }
function code()         { cd "$CODE_DIR/$(join_by / "$@")" ; }
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
