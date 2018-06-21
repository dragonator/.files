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
alias ll='ls -l'
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
# Source bash completion for alacritty
source $HOME/.config/alacritty/alacritty-completions.bash

# Completion for code function
__code_complete() {
    local cur;
    cur=$(join_by / "${COMP_WORDS[@]}" | sed -e 's/code\///')
    match_result="$CODE_DIR/$cur"
    COMPREPLY=( $(compgen -d "$match_result" | sed -e 's,'".*/"',,'))
}

complete -F __code_complete code

##############################################################
##                        Functions                         ##
##############################################################
# Shortcut to code (sub)directory
function code() {
    local code_subdir
    code_subdir=$(join_by / "$@")
    cd "$CODE_DIR/$code_subdir"
}

function join_by() { local IFS="$1"; shift; echo "$*"; }

# Extract rpm in curent directory
function xrpm() { rpm2cpio "$1" | cpio -idmv ; }

# Remove duplicated entries in PATH
function sanitize_path() {
  if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
      x=${old_PATH%%:*}       # the first remaining entry
      case $PATH: in
        *:"$x":*) ;;         # already there
        *) PATH=$PATH:$x;;    # not there yet
      esac
      old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
  fi
}

sanitize_path
