##############################################################
##                  Configure GIT prompt                    ##
##############################################################
# Set config variables first
#GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

#GIT_PROMPT_COMMAND_OK="${GREEN}✔ " # displays as ✔
#GIT_PROMPT_COMMAND_FAIL="${RED}✘-_LAST_COMMAND_STATE_ "
GIT_PROMPT_COMMAND_OK="${GREEN}$" # displays as ✔
GIT_PROMPT_COMMAND_FAIL="${RED}(_LAST_COMMAND_STATE_)$"
GIT_PROMPT_START="${PS1_START}"    # uncomment for custom prompt start sequence
GIT_PROMPT_END="${PS1_END}"   # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Solarized # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

source ~/.bash-git-prompt/gitprompt.sh

##############################################################
##                          Aliases                         ##
##############################################################
alias glog="git log -n 15 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gdif="git diff"
alias gdiff="git diff"
alias gdifno="git diff --name-only"
alias gst="git status"
alias gad="git add"
alias gadd="git add"

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

