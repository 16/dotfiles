#!/usr/bin/env zsh

# ${o:a:h} is Zsh magic for directory where script resides
# 0 (path to script), :a (absolute path), :h (head (drop filename))
# See http://zsh.sourceforge.net/Doc/Release/Expansion.html#Modifiers
DOTFILES_DIR=${0:a:h}

# Install Tmux Plugin Manager per https://github.com/tmux-plugins/tpm
# (Still need to install your plug-ins one time with Ctrl-B I)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	echo Installing Tmux Plugin Manager
	git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Make a symlink in $HOME to each of the .dotfiles in stows/
echo Installing dotfiles.
stow --override=".*" --restow --target=$HOME --dir="$DOTFILES_DIR" stows

if [ -d "$DOTFILES_DIR/local_$(hostname -s)" ]; then
	echo "Using local overrides ($DOTFILES_DIR/local_$(hostname -s))"
	stow --override=".*" --restow --target=$HOME --dir="$DOTFILES_DIR" "local_$(hostname -s)"
else
	echo "No local overrides found ($DOTFILES_DIR/local_$(hostname -s))"
fi
