#!/bin/bash
##############################################################
##                   Customize bash prompt                  ##
##############################################################
# Colors
RED="\[\e[38;5;160m\]"
GREEN="\[\e[38;5;112m\]"
YELLOW="\[\e[38;5;178m\]"
BLUE="\[\e[38;5;110m\]"
BOLD="\[\e[1m\]"
END="\[\e[0m\]"

PS1_START="${BOLD}${RED}\d \t${END}"
PS1_END=" ${BOLD}${YELLOW}\w\n${GREEN}\u${BLUE}@\h _LAST_COMMAND_INDICATOR_ \[$(tput sgr0)\]"
PS1="${PS1_START}${PS1_END}"

# Adjust the title the current directory
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

##############################################################
##                     Bash Completions                     ##
##############################################################
# Completion for code function
function __code_complete
{
    local cur;
    cur=$(join_by / "${COMP_WORDS[@]}" | sed -e 's/code\///')
    match_result="$CODE_DIR/$cur" #"$CODE_DIR/$cur"
    COMPREPLY=( $(compgen -d "$match_result" | sed -e 's,'".*/"',,')) # | sed -e 's/[^/]\///') )
    
}
complete -F __code_complete code

##############################################################
##                        Functions                         ##
##############################################################
# Shortcut to code (sub)directory
function code
{
    local code_subdir
    code_subdir=$(join_by / "$@")
    cd "$CODE_DIR/$code_subdir"
}

function join_by { local IFS="$1"; shift; echo "$*"; }

##############################################################
##                          Others                          ##
##############################################################
# Set "**" to match all files and zero or more directories and subdirectories.
shopt -s globstar

##############################################################
##                         Aliases                          ##
##############################################################
alias tree='tree -a --dirsfirst -I .git'
