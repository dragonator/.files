#!/bin/bash

# Require sudo rights
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

##############################################################
##                      Miscellaneous                       ##
##############################################################
# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Remove links at HOME
echo "-> Removing links from $HOME"
rm -f $HOME/.inputrc
rm -f $HOME/.vim
rm -f $HOME/.vimrc
rm -f $HOME/.tmux.conf
rm -f $HOME/.tmux
rm -f $HOME/.tmux-themepack
rm -f $HOME/.gitconfig
rm -f $HOME/.bash-git-prompt
rm -f $HOME/.git-prompt-colors.sh
rm -f $HOME/.rbenv

# Delete configuration
echo "-> Deleting configurations"
rm -rf $DIR/vim/plugs
rm -rf $DIR/tmux/plugins
rm -rf $DIR/bash-git-prompt
rm -rf $DIR/rbenv

# Uninstall packages
echo "-> Removing tree"
sudo apt remove --assume-yes tree  ; echo
echo "-> Removing vim"
sudo apt remove --assume-yes vim   ; echo
echo "-> Removing tmux"
sudo apt remove --assume-yes tmux  ; echo
echo "-> Removing git"
sudo apt remove --assume-yes git   ; echo
echo "-> Removing xclip"
sudo apt remove --assume-yes xclip ; echo
echo "-> Autoremoving packages"
sudo apt autoremove --assume-yes

echo "-> WARNING: Remove sourcing of master.bashrc.sh"
echo "-> Fninished."
