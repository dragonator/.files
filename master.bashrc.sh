##############################################################
##                        Env vars                          ##
##############################################################
export EDITOR="vim"
export TERM="xterm-256color"
export PATH="/usr/local/bin:$PATH"

# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##############################################################
##                          Ruby                            ##
##############################################################
eval "$(rbenv init -)"

##############################################################
##                           Go                             ##
##############################################################
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

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
source $DIR/misc.bashrc.sh
source $DIR/aliases.bashrc.sh
source $DIR/git.bashrc.sh

source <(jump shell bash)
source <(kubectl completion bash)

sanitize_path
