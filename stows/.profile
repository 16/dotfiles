# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# GitHub API token (to avoid API rate limit)
export HOMEBREW_GITHUB_API_TOKEN=324c1ab511abb7986f453018c40281eb64f58823

# PATH. Homebrew first.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/opt/X11/bin:$HOME/opt/bin"

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

if [ -d $(brew --prefix homebrew/php/php56)/bin ] ; then
  export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
fi

if [ -n "$PS1" ]; then # if statement guards adding these helpers for non-interative shells
  eval "$(~/dotfiles/base16-shell/profile_helper.sh)"
fi
