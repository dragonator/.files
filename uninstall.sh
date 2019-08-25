#!/bin/bash
echo "The script needs sudo rights for package removal:"
sudo echo

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
PACKAGES=(git tree vim tmux xclip fonts-firacode curl)
RUBY_BUILD_DEPS=(gcc make libssl-dev libreadline-dev zlib1g-dev)

for pkg in ${PACKAGES[@]} ${RUBY_BUILD_DEPS[@]}; do
  echo "-> Removing ${pkg}"
  sudo apt install --assume-yes $pkg
  echo
done

echo "-> Autoremoving packages"
sudo apt autoremove --assume-yes

echo "-> WARNING: Remove sourcing of master.bashrc.sh"
echo "-> Fninished."
