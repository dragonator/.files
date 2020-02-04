#!/bin/bash
echo "The script needs sudo rights for package installation:"
sudo echo

# Get directory of current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##############################################################
##                     Install packages                     ##
##############################################################
echo "=> Installing packages"
PACKAGES=(git tree vim tmux xclip fonts-firacode curl shellcheck)
RUBY_BUILD_DEPS=(gcc make libssl-dev libreadline-dev zlib1g-dev)

echo "-> Add universe repository"
sudo add-apt-repository universe
echo

echo "-> Updating apt cache"
sudo apt update
echo

for pkg in "${PACKAGES[@]}" "${RUBY_BUILD_DEPS[@]}"; do
  echo "-> Installing ${pkg}"
  sudo apt install --assume-yes "$pkg"
  echo
done

echo "-> Autoremoving packages"
sudo apt autoremove --assume-yes
echo

##############################################################
##                          (N)Vim                          ##
##############################################################
echo "=> Configuring Vim"
ln -sTfv "$DIR/vimrc" "$HOME/.vimrc"
ln -sTfv "$DIR/vim"   "$HOME/.vim"
echo

#ln -sTfv "$DIR/config/nvim" "$HOME/.config/nvim"
echo "-> Installing Vim plugins"
vim -c PlugInstall -c qa
echo

##############################################################
##                           Tmux                           ##
##############################################################
echo "=> Configuring Tmux"
TMUX_PLUGIN_DIR="$DIR/tmux/plugins"
TPM_DIR="$TMUX_PLUGIN_DIR/tpm"
ln -sTfv "$DIR/tmux.conf"      "$HOME/.tmux.conf"
ln -sTfv "$DIR/tmux"           "$HOME/.tmux"
echo

echo "=> Cloning Tmux themes"
git clone https://github.com/jimeh/tmux-themepack.git "$HOME/.tmux-themepack"
echo

echo "-> Installing TPM"
mkdir -pv "$TMUX_PLUGIN_DIR"
git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
echo

echo "-> Updating TPM"
git -C "$TPM_DIR" pull
echo

# Install TPM plugins
echo "-> Installing TPM Plugins"
tmux start-server      # start a server but don't attach to it
tmux new-session -d    # create a new session but don't attach to it either
"$TMUX_PLUGIN_DIR/tpm/scripts/install_plugins.sh"   # install the plugins
tmux kill-server       # killing the server is not required, I guess
echo

##############################################################
##                            Git                           ##
##############################################################
echo "=> Configuring Git"
ln -sTfv "$DIR/gitconfig" "$HOME/.gitconfig"
ln -sTfv "$DIR/git-prompt-colors.sh" "$HOME/.git-prompt-colors.sh"
echo

# Installing bash-git-prompt
BASH_GIT_PROMPT_DIR="$DIR/bash-git-prompt"
echo "-> Installing bash-git-prompt"
git clone https://github.com/magicmonty/bash-git-prompt "$BASH_GIT_PROMPT_DIR"
ln -sTfv "$DIR/bash-git-prompt" "$HOME/.bash-git-prompt"
echo

echo "-> Updating bash-git-prompt"
git -C "$BASH_GIT_PROMPT_DIR" pull
echo

##############################################################
##                           Kitty                          ##
##############################################################
LOCAL_APPLICATIONS="$HOME/.local/share/applications"

echo "=> Installing Kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
  launch=n
echo

mkdir -pv "$HOME/bin"
ln -sTfv  "$DIR/config/kitty"                 "$HOME/.config/kitty"
ln -sTfv  "$HOME/.local/kitty.app/bin/kitty"  "$HOME/bin/kitty"
cp -v     "$DIR/config/kitty/kitty.desktop"   "$LOCAL_APPLICATIONS/kitty.desktop"
sed -i    "s/USER/$USER/g"                  "$LOCAL_APPLICATIONS/kitty.desktop"
cp -v     "$LOCAL_APPLICATIONS/kitty.desktop" "$HOME/.local/kitty.app/share/applications/"
chmod -v  u+x "$LOCAL_APPLICATIONS/kitty.desktop"
echo

##############################################################
##                            Ruby                          ##
##############################################################
echo "=> Configuring Ruby"
RUBY_VERSION="2.6.3"
RBENV_DIR="$DIR/rbenv"
RUBY_BUILD_DIR="$RBENV_DIR/plugins/ruby-build"

echo "-> Installing rbenv"
git clone https://github.com/rbenv/rbenv.git "$RBENV_DIR"
ln -sTfv "$RBENV_DIR" "$HOME/.rbenv"
echo

echo "-> Updating rbenv"
git -C "$RBENV_DIR" pull
echo

echo "-> Installing ruby-build"
git clone https://github.com/rbenv/ruby-build.git "$RUBY_BUILD_DIR"
echo

echo "-> Updating ruby-build"
git -C "$RUBY_BUILD_DIR" pull
echo

echo "-> Installing Ruby v$RUBY_VERSION"
"$RBENV_DIR/bin/rbenv" install --skip-existing "$RUBY_VERSION"
"$RBENV_DIR/bin/rbenv" global "$RUBY_VERSION"
echo

echo "-> Installing gems"
"$RBENV_DIR/shims/gem" install bundler
"$RBENV_DIR/shims/gem" install rubocop
echo

##############################################################
##                      Miscellaneous                       ##
##############################################################
SOURCE_MASTER_BASHRC="""
# Source custom configuration
source $HOME/.files/master.bashrc.sh"""

echo "=> Sourcing master.bashrc.sh"
if ! grep "master.bashrc.sh" "$HOME/.bashrc" ; then
    echo "$SOURCE_MASTER_BASHRC" >> "$HOME/.bashrc"
fi
echo

echo "=> Miscellaneous"
mkdir -pv "$HOME/code"
ln -sTfv "$DIR/inputrc" "$HOME/.inputrc"
echo

##############################################################
echo "=> Finished."
