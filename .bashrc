# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#----------------------------------------------------------#
#                  Customize bash prompt                   #
#----------------------------------------------------------#
# Colors
#  Black       0;30     Dark Gray     1;30
#  Blue        0;34     Light Blue    1;34
#  Green       0;32     Light Green   1;32
#  Cyan        0;36     Light Cyan    1;36
#  Red         0;31     Light Red     1;31
#  Purple      0;35     Light Purple  1;35
#  Brown       0;33     Yellow        1;33
#  Light Gray  0;37     White         1;37
RED="\[\033[1;31m\]"
GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[1;34m\]"

PS1="${RED}\d ${RED}\t ${YELLOW}\w\n${GREEN}\u${BLUE}@\h \\$ \[$(tput sgr0)\]"
export PS1

#----------------------------------------------------------#
#                  Internal Variables                      #
#----------------------------------------------------------#
## Must be unset at the end of file

# Path to code directory
CODE_DIR="$HOME/code"

#----------------------------------------------------------#
#                   Export Variables                       #
#----------------------------------------------------------#
# Turn off python byte code (*.pyc)
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING="UTF-8"

# Fix terminal language
export LC_ALL=C

# Add nand2tetris bin directory to PATH
export PATH=$PATH:~/code/nand2tetris/tools

# Set vim as default editor
export EDITOR=vim

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

#----------------------------------------------------------#
#                    Bash Completions                      #
#----------------------------------------------------------#
# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Completion for code function
__code_complete()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -d "$CODE_DIR/$cur" | cut -d '/' -f 5) )
    
}
complete -F __code_complete code

#----------------------------------------------------------#
#                       Functions                          #
#----------------------------------------------------------#
# Shortcut to nand2tetris projects directory
nand()
{
    project_dir=$1
    size=${#project_dir}
    if [ "$size" -lt 2 ];then
        project_dir="0${project_dir}"
    fi
    
    cd "${HOME}/code/nand2tetris/projects/${project_dir}"
}

# Shortcut to code (sub)directory
code () { cd "$CODE_DIR/$1" ; }

#----------------------------------------------------------#
#                         Others                           #
#----------------------------------------------------------#
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set "**" to match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Source aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
