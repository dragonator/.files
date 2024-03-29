##############################################################
##                         Aliases                          ##
##############################################################
# vim
#alias vim='nvim'
alias v='vim'
alias vd='vimdiff'

# vscode
alias vscode='`which code`'

# tree
alias tree='tree -a --dirsfirst -C -I .git'
alias t='tree'
alias tl='tree -l -L'

# ls
alias ls='ls --color'
alias l='ls'
alias ll='ls -ltrh'
alias la='ll -a'
alias lla='la'

# grep
alias grep='grep --color -n'

# Useful kubertenes (k8s) aliases
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ktx='kubectx'

# bundle
alias be='bundle exec'
alias bu='bundle update'
alias bi='bundle install'

# shortcuts
alias .f='cd ~/.files'
alias vimrc='vim ~/.vim/vimrc'

# git
alias g='git'
alias gl='git log'
alias gnl='git netlog'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdno='git diff --name-only'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gc='git commit'
alias gcm='git commit -m'
alias grb='git rebase'

# alias completion (see more on misc.bashrc.sh)
complete -F _complete_alias k
complete -F _complete_alias kg
complete -F _complete_alias gco
