#!/bin/bash

# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Vim config
ln -s $DIR/.vimrc $HOME/.vimrc
ln -s $DIR/.vim   $HOME/.vim
vim -c PlugInstall -c qa

# Bash resources
echo >> $HOME/.bashrc
echo "source $DIR/.custom_bashrc.sh" >> $HOME/.bashrc
echo "source $DIR/.ruby_bashrc.sh"   >> $HOME/.bashrc
echo "source $DIR/.git_bashrc.sh"    >> $HOME/.bashrc

# Others
ln -s $DIR/.tmux.conf        $HOME/.tmux.conf
ln -s $DIR/.tmux             $HOME/.tmux
ln -s $DIR/.tmux-themepack   $HOME/.tmux-themepack
ln -s $DIR/.gitconfig        $HOME/.gitconfig
ln -s $DIR/.inputrc          $HOME/.inputrc
ln -s $DIR/.config/alacritty $HOME/.config/alacritty
ln -s $DIR/.config/nvim      $HOME/.config/nvim

# Create local structure
mkdir -p $HOME/local/bin
mkdir -p $HOME/local/tools
ln -s $HOME/local/bin $HOME/bin

# Install and configure bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt $HOME/.bash-git-prompt
ln -s $DIR/.git-prompt-colors.sh $HOME/.git-prompt-colors.sh
