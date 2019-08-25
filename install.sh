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
ln -sTf $DIR/inputrc $HOME/.inputrc

echo "=> Sourcing master.bashrc.sh"
SOURCE_MASTER_BASHRC="""
# Source custom configuration
source $HOME/.files/master.bashrc.sh"""
if ! grep "master.bashrc.sh" $HOME/.bashrc ; then
    echo "$SOURCE_MASTER_BASHRC" >> $HOME/.bashrc
fi

echo
##############################################################
##                     Install packages                     ##
##############################################################
echo "=> Updating apt cache"
sudo apt update
echo "=> Installing tree"
sudo apt install --assume-yes tree  ; echo
echo "=> Installing vim"
sudo apt install --assume-yes vim   ; echo
echo "=> Installing tmux"
sudo apt install --assume-yes tmux  ; echo
echo "=> Installing git"
sudo apt install --assume-yes git   ; echo
echo "=> Installing xclip"
sudo apt install --assume-yes xclip ; echo
echo "=> Installing ruby-build dependencies"
sudo apt install --assume-yes libssl-dev libreadline-dev zlib1g-dev ; echo
echo "=> Autoremoving packages"
sudo apt autoremove --assume-yes    ; echo

##############################################################
##                          (N)Vim                          ##
##############################################################
echo "=> Configuring Vim"

# (N)Vim config
ln -sTf $DIR/vimrc $HOME/.vimrc
ln -sTf $DIR/vim   $HOME/.vim
#ln -sTf $DIR/config/nvim $HOME/.config/nvim
echo "=> Installing Vim plugins"
vim -c PlugInstall -c qa

echo
##############################################################
##                           Tmux                           ##
##############################################################
echo "=> Configuring Tmux"

# Create symbolic links from $HOME to Tmux configuration files
ln -sTf $DIR/tmux.conf      $HOME/.tmux.conf
ln -sTf $DIR/tmux           $HOME/.tmux
ln -sTf $DIR/tmux-themepack $HOME/.tmux-themepack

# Install TPM (Tmux Plugin Manager)
TMUX_PLUGIN_DIR="$DIR/tmux/plugins"
mkdir -p $TMUX_PLUGIN_DIR

TPM_DIR="$TMUX_PLUGIN_DIR/tpm"
echo "=> Installing TPM"
git clone https://github.com/tmux-plugins/tpm $TPM_DIR

echo "=> Updating TPM"
git -C $TPM_DIR pull

# Install TPM plugins
echo "=> Installing TPM Plugins"
tmux start-server      # start a server but don't attach to it
tmux new-session -d    # create a new session but don't attach to it either
$TMUX_PLUGIN_DIR/tpm/scripts/install_plugins.sh   # install the plugins
tmux kill-server       # killing the server is not required, I guess

echo
##############################################################
##                            Git                           ##
##############################################################
echo "=> Configuring Git"
ln -sTf $DIR/gitconfig $HOME/.gitconfig

# Installing bash-git-prompt
BASH_GIT_PROMPT_DIR="$DIR/bash-git-prompt"
echo "=> Installing bash-git-prompt"
git clone https://github.com/magicmonty/bash-git-prompt $BASH_GIT_PROMPT_DIR

echo "=> Updating bash-git-prompt"
git -C $BASH_GIT_PROMPT_DIR pull

ln -sTf $DIR/bash-git-prompt      $HOME/.bash-git-prompt
ln -sTf $DIR/git-prompt-colors.sh $HOME/.git-prompt-colors.sh

echo
##############################################################
##                            Ruby                          ##
##############################################################
echo "=> Configuring Ruby"

RBENV_DIR="$DIR/rbenv"
echo "=> Installing rbenv"
git clone https://github.com/rbenv/rbenv.git $RBENV_DIR

echo "=> Updating rbenv"
git -C $RBENV_DIR pull

ln -sTf $RBENV_DIR $HOME/.rbenv

RUBY_BUILD_DIR="$RBENV_DIR/plugins/ruby-build"
echo "=> Installing ruby-build"
git clone https://github.com/rbenv/ruby-build.git $RUBY_BUILD_DIR

echo "=> Updating ruby-build"
git -C $RUBY_BUILD_DIR pull

RUBY_VERSION="2.6.3"
echo "=> Installing Ruby v$RUBY_VERSION"
$RBENV_DIR/bin/rbenv install --skip-existing $RUBY_VERSION
$RBENV_DIR/bin/rbenv global  $RUBY_VERSION

echo "=> Installing Bundler"
$RBENV_DIR/shims/gem install bundler

echo
##############################################################
echo "=] Finished."
