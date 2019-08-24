##############################################################
##                  Configure GIT prompt                    ##
##############################################################
# Set config variables first
# GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# Use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
GIT_PROMPT_THEME=Custom

# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh

# As last entry source the gitprompt script
source ~/.bash-git-prompt/gitprompt.sh

##############################################################
##                          Aliases                         ##
##############################################################
alias glog="git netlog"
alias gd="git diff"
alias gdif="git diff"
alias gdiff="git diff"
alias gdifc="git diff --cached"
alias gdifno="git diff --name-only"
alias gs="git status"
alias gst="git status"
alias gad="git add"
alias gadd="git add"
alias gcom="git commit -m"

##############################################################
##                       Functions                          ##
##############################################################
# Clone a Git repository into a non-empty directory
function non_empty_clone
{
    git init
    git remote add origin "$1"
    git fetch
    git checkout -t origin/master
}

# Disable automatic Git fetch
function disable_fetch()  {
    git_root=`git rev-parse --show-toplevel`
    echo 'FETCH_REMOTE_STATUS=0' >> "$git_root"/.bash-git-rc
}

# Disable Git prompt which causes delays on big repositories
function disable_prompt() {
    git_root=`git rev-parse --show-toplevel`
    echo 'GIT_PROMPT_IGNORE=1'   >> "$git_root"/.bash-git-rc
}

# Enable Git prompt which causes delays on big repositories
function restore_prompt() {
    git_root=`git rev-parse --show-toplevel`
    rm -f "$git_root"/.bash-git-rc
}

##############################################################
##                      Completion                          ##
##############################################################
# Enable bash completions for Git
source ~/.files/git-completion.bash
