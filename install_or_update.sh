#!/usr/bin/env zsh

# ${o:a:h} is Zsh magic for directory where script resides
# 0 (path to script), :a (absolute path), :h (head (drop filename))
# See http://zsh.sourceforge.net/Doc/Release/Expansion.html#Modifiers
DOTFILES_DIR=${0:a:h}

# Install zplug for zsh
#export ZPLUG_HOME=/usr/local/opt/zplug
#if [ ! -d "$ZPLUG_HOME" ]; then
#	echo Installing Zplug
#  brew update
#  brew install zplug
#fi

# Install Tmux Plugin Manager per https://github.com/tmux-plugins/tpm
# (Still need to install your plug-ins one time with Ctrl-B I)
#if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
#	echo Installing Tmux Plugin Manager
#	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
#fi

# Install vim-plug
if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo "Install vim-plug"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install scripts like tmux-vim-select-pane
#echo Installing scripts like tmux-vim-select-pane in ~/opt/bin.
#stow --override=".*" --restow --target="$HOME/opt/bin" --dir="$DOTFILES_DIR" bin

# Make a symlink in $HOME to each of the .dotfiles in stows/
echo Installing dotfiles.
stow --override=".*" --restow --target=$HOME --dir="$DOTFILES_DIR" stows

#if [ -d "$DOTFILES_DIR/local_$(hostname -s)" ]; then
#	echo "Using local overrides ($DOTFILES_DIR/local_$(hostname -s))"
#	stow --override=".*" --restow --target=$HOME --dir="$DOTFILES_DIR" "local_$(hostname -s)"
#else
#	echo "No local overrides found ($DOTFILES_DIR/local_$(hostname -s))"
#fi

# In order to use vim existing config files with NeoVim
echo Create symlinks in order to use existing vim config files with NeoVim 
if hash nvim 2>/dev/null; then
  if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
  fi
  if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s ~/.vim ~/.config/nvim
  fi
  if [ ! -e "$HOME/.config/nvim/init.vim" ]; then
    ln -s ~/.vimrc ~/.config/nvim/init.vim
  fi
fi

#echo Create a symlink to base16-shell
#if [ ! -d "$HOME/.config/base16-shell" ]; then
#  ln -s "$DOTFILES_DIR/base16-shell" "$HOME/.config/base16-shell"
#fi
