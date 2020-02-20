##############################################################
##                         Aliases                          ##
##############################################################
# tree
alias t='tree'
alias tree='tree -a --dirsfirst -C -I .git'

# ls
alias ls='\ls -G'
alias ll='\ls -ltrh -G'
alias la='ll -a'
alias lla='la'

# grep
alias grep='grep --color -n'

# Useful kubertenes (k8s) aliases
alias ktx='kubectx'
alias k='kubectl'
alias kg='kubectl get'

# bundle
alias be='bundle exec'
alias bu='bundle update'
alias bi='bundle install'

# shortcuts
alias .f='cd ~/.files'

# git
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
