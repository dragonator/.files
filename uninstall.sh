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
rm -fv $HOME/.vimrc
rm -fv $HOME/.vim
rm -fv $HOME/.tmux.conf
rm -fv $HOME/.tmux
rm -fv $HOME/.tmux-themepack
rm -fv $HOME/.gitconfig
rm -fv $HOME/.git-prompt-colors.sh
rm -fv $HOME/.bash-git-prompt
rm -fv $HOME/.config/kitty
rm -fv $HOME/bin/kitty
rm -fv $HOME/.rbenv
rm -fv $HOME/.inputrc

# Delete configuration
echo "-> Deleting configurations"
rm -fv  $HOME/.local/share/applications/kitty.desktop
rm -rfv $HOME/.local/kitty.app
rm -rfv $DIR/vim/plugs
rm -rfv $DIR/tmux/plugins
rm -rfv $DIR/bash-git-prompt
rm -rfv $DIR/rbenv

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
