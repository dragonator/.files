##############################################################
##                         Aliases                          ##
##############################################################
alias tree='tree -a --dirsfirst -C -I .git'
#alias ls='tree -L 1'
alias ls='\ls -G'
alias ll='\ls -ltrh -G'
alias la='ll -a'
alias lla='la'
alias grep='grep --color -n'
alias .files='cd ~/.files'
alias .f='.files'

# Useful k8s aliases
alias ktx='kubectx'
alias k='kubectl'
alias kg='kubectl get'
