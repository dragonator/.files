##############################################################
##                        Env vars                          ##
##############################################################
export EDITOR="vim"
export TERM="xterm-256color"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTSIZE="10000"

##############################################################
##                           Go                             ##
##############################################################
export GOPATH="$HOME/code/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

##############################################################
##                         Python                           ##
##############################################################
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/code"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
source /usr/local/bin/virtualenvwrapper.sh

##############################################################
##                Includes and integrations                 ##
##############################################################
# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# load completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source $DIR/git-completion.sh

source $DIR/misc.bashrc.sh
source $DIR/complete_alias.sh
source $DIR/aliases.bashrc.sh
source $DIR/git.bashrc.sh

source <(jump shell bash)
source <(kubectl completion bash)
source <(dircolors $DIR/dir_colors)
source <(rbenv init -)

sanitize_path
