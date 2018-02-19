# $(brew --prefix)
export BREW_HOME="/usr/local"
# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# PATH. Homebrew first.
export PATH="$BREW_HOME/bin:$BREW_HOME/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/opt/X11/bin:$HOME/opt/bin"

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# $(brew --prefix homebrew/php/php56)
php56_path="$BREW_HOME/opt/php56"
if [ -d $php56_path/bin ] ; then
  export PATH="$php56_path/bin:$PATH"
fi
