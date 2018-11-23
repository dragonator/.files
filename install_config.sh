#!/bin/bash

# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# (N)Vim config
ln -s $DIR/.vimrc       $HOME/.vimrc
ln -s $DIR/.vim         $HOME/.vim
ln -s $DIR/.config/nvim $HOME/.config/nvim
vim -c PlugInstall -c qa

# Tmux config
mkdir -p $DIR/.tmux/plugins
ln -s $DIR/.tmux.conf      $HOME/.tmux.conf
ln -s $DIR/.tmux           $HOME/.tmux
ln -s $DIR/.tmux-themepack $HOME/.tmux-themepack

# Bash config
echo >> $HOME/.bashrc
echo "eval \"\$(jump shell)\""       >> $HOME/.bashrc
echo "eval \"\$(thefuck --alias)\""  >> $HOME/.bashrc
echo "source $DIR/.custom_bashrc.sh" >> $HOME/.bashrc
echo "source $DIR/.ruby_bashrc.sh"   >> $HOME/.bashrc
echo "source $DIR/.git_bashrc.sh"    >> $HOME/.bashrc
echo "sanitize_path"                 >> $HOME/.bashrc
git clone https://github.com/magicmonty/bash-git-prompt $HOME/.bash-git-prompt
ln -s $DIR/.git-prompt-colors.sh $HOME/.git-prompt-colors.sh

# Others
ln -s $DIR/.gitconfig        $HOME/.gitconfig
ln -s $DIR/.inputrc          $HOME/.inputrc

# Create local structure
mkdir -p $HOME/local/bin
mkdir -p $HOME/local/tools
ln -s $HOME/local/bin $HOME/bin

