##############################################################
##                        Env vars                          ##
##############################################################
export EDITOR="vim"
export TERM="xterm-256color"
export PATH="/usr/local/bin:$PATH"

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export HISTSIZE="10000"

##############################################################
##                           Go                             ##
##############################################################
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export GOPATH="$HOME/go"
export GO111MODULE="on"
export PATH="$PATH:$(go env GOPATH)/bin"
export GOTESTSUM_FORMAT="testname"
export GOPRIVATE="gitlab.theopentag.com"

##############################################################
##                Includes and integrations                 ##
##############################################################

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# load completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source $DIR/git-completion.sh

source $DIR/misc.bashrc.sh
source $DIR/complete_alias.sh
source $DIR/aliases.bashrc.sh
source $DIR/git.bashrc.sh

if kubectl -v &> /dev/null
then
    source <(kubectl completion bash)
fi

source <(dircolors $DIR/dir_colors)

sanitize_path
