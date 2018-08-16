##############################################################
##                  Configure GIT prompt                    ##
##############################################################
# Set config variables first
# GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# as last entry source the gitprompt script
GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh

source ~/.bash-git-prompt/gitprompt.sh

##############################################################
##                          Aliases                         ##
##############################################################
alias glog="git netlog"
alias gdif="git diff"
alias gdiff="git diff"
alias gdifc="git diff --cached"
alias gdifno="git diff --name-only"
alias gst="git status"
alias gad="git add"
alias gadd="git add"
alias gcom="git commit -m"

##############################################################
##                       Functions                          ##
##############################################################
function non_empty_clone
{
    git init
    git remote add origin "$1"
    git fetch
    git checkout -t origin/master
}

function disable_fetch()  { echo 'FETCH_REMOTE_STATUS=0' >> `git rev-parse --show-toplevel`/.bash-git-rc ; }
function disable_prompt() { echo 'GIT_PROMPT_IGNORE=1'   >> `git rev-parse --show-toplevel`/.bash-git-rc ; }
function restore_prompt() { rm -f `git rev-parse --show-toplevel`/.bash-git-rc ; }

##############################################################
##                      Completion                          ##
##############################################################
source ~/.files/git-completion.bash
