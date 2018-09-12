# $(brew --prefix)
export BREW_HOME="/usr/local"
# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# PATH. Homebrew first.
export PATH="$BREW_HOME/bin:$BREW_HOME/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/opt/X11/bin:$HOME/opt/bin"

php56_path="$BREW_HOME/opt/php@5.6"
if [ -d $php56_path/bin ] ; then
  export PATH="$php56_path/bin:$PATH"
fi
if [ -d $php56_path/sbin ] ; then
  export PATH="$php56_path/sbin:$PATH"
fi

sqlite3_path="$BREW_HOME/opt/sqlite"
if [ -d $sqlite3_path/bin ] ; then
  export PATH="$sqlite3_path/bin:$PATH"
fi
