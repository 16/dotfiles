export ZPLUG_HOME=$BREW_HOME/opt/zplug
source $ZPLUG_HOME/init.zsh


# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github, defer:0
# Load completion library for those sweet [tab] squares
zplug "modules/completion", from:prezto
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "modules/homebrew",   from:prezto
zplug "plugins/z", from:oh-my-zsh
zplug "andrewferrier/fzf-z"
zplug "laurenkt/zsh-vimto"
# Theme!
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# base16
zplug "~/.config/base16-shell", use:"*.zsh", from:local

# Homebrew zsh completions
fpath=($BREW_HOME/share/zsh/site-functions $fpath)

# zplug managed itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#       echo; zplug install
#   fi
# fi

zplug load

# Personnal aliases
alias apgs="apg -m 8 -x 12 -s"
alias ll="exa -l --git"
alias la="exa -la --git"
alias lt="exa -T -L 2"

# Default User
# You'll want to add in a DEFAULT_USER, set it to whatever your system username is.
# You'll want to do this so that you agnoster doesn't display username@yourmachine 
# in front of all your paths locally, it gets annoying fast.
# <http://szarapka.com/zshohmyzsh/>
DEFAULT_USER="fabrice"

# Enable bash completion compatibility
autoload bashcompinit
bashcompinit

# Other ZSH completions
source ~/.tldr.complete

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

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
# FASD (https://github.com/clvv/fasd)
# eval "$(fasd --init auto)"

# -- TMUX --
# For fixing colors with tmux
# export TERM="screen-256color"
# alias tmux="tmux -2"

# for Tmux projects
function new-tmux-from-dir-name { tmux new-session -As `basename $PWD` } 
alias tnew="new-tmux-from-dir-name"

# Alias to direct edit of my main taskpaper todo file
alias todo="cd $HOME/ownCloud/Notes && nvim *.taskpaper"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
