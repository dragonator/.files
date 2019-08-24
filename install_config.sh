#!/bin/bash

##############################################################
##                      Miscellaneous                       ##
##############################################################
# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create local structure
#mkdir -p $HOME/local/bin
#mkdir -p $HOME/local/tools
#ln -sTf $HOME/local/bin $HOME/bin
mkdir -p $HOME/code
ls -sTf $DIR/inputrc $HOME/.inputrc

echo "Sourcing master.bashrc.sh"
SOURCE_MASTER_BASHRC="""
# Source custom configuration
source $HOME/.files/master.bashrc.sh"""
if ! grep "master.bashrc.sh" $HOME/.bashrc ; then
    echo "$SOURCE_MASTER_BASHRC" >> $HOME/.bashrc
fi

##############################################################
##                          (N)Vim                          ##
##############################################################
echo "Configuring Vim"

# (N)Vim config
ln -sTf $DIR/vimrc $HOME/.vimrc
ln -sTf $DIR/vim   $HOME/.vim
#ln -sTf $DIR/config/nvim $HOME/.config/nvim
echo "Installing Vim plugins"
vim -c PlugInstall -c qa

##############################################################
##                           Tmux                           ##
##############################################################
echo "Configuring Tmux"

# Create symbolic links from $HOME to Tmux configuration files
ln -sTf $DIR/tmux.conf      $HOME/.tmux.conf
ln -sTf $DIR/tmux           $HOME/.tmux
ln -sTf $DIR/tmux-themepack $HOME/.tmux-themepack

# Install TPM (Tmux Plugin Manager)
echo "Installing TPM"
TMUX_PLUGIN_DIR="$DIR/tmux/plugins"
mkdir -p $TMUX_PLUGIN_DIR
git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_DIR/tpm

# Install TPM plugins
echo "Installing TPM Plugins"
tmux start-server      # start a server but don't attach to it
tmux new-session -d    # create a new session but don't attach to it either
$TMUX_PLUGIN_DIR/tpm/scripts/install_plugins.sh   # install the plugins
tmux kill-server       # killing the server is not required, I guess

##############################################################
##                            Git                           ##
##############################################################
echo "Configuring Git"
ln -sTf $DIR/gitconfig $HOME/.gitconfig

# Installing bash-git-prompt
echo "Installing bash-git-prompt"
git clone https://github.com/magicmonty/bash-git-prompt $DIR/bash-git-prompt
ln -sTf $DIR/bash-git-prompt      $HOME/.bash-git-prompt
ln -sTf $DIR/git-prompt-colors.sh $HOME/.git-prompt-colors.sh

echo "Finished."
