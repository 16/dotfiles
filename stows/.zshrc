export ZPLUG_HOME=$HOME/.config/zplug
source $ZPLUG_HOME/init.zsh


# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github, defer:0
# Load completion library for those sweet [tab] squares
zplug "modules/completion", from:prezto
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "plugins/z", from:oh-my-zsh
zplug "andrewferrier/fzf-z"
# zplug "laurenkt/zsh-vimto"
zplug "momo-lab/zsh-abbrev-alias"
# Theme!
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "sbugzu/gruvbox-zsh", use:gruvbox.zsh-theme, as:theme

# base16
# zplug "~/.config/base16-shell", use:"*.zsh", from:local

# Homebrew zsh completions
# t clone https://github.com/zplug/zplug $ZPLUG_HOMEfpath=($BREW_HOME/share/zsh/site-functions $fpath)

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

# Gruvbox theme
# source "$HOME/.local/share/nvim/plugged/gruvbox/gruvbox_256palette.sh"
# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"

# Default User
# You'll want to add in a DEFAULT_USER, set it to whatever your system username is.
# You'll want to do this so that you agnoster doesn't display username@yourmachine 
# in front of all your paths locally, it gets annoying fast.
# <http://szarapka.com/zshohmyzsh/>
DEFAULT_USER="fabrice"

# load functions from .zfunc folder
fpath=(~/.zfunc $fpath)

# Other ZSH completions
source ~/.tldr.complete

# load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# php56_path="$BREW_HOME/opt/php@5.6"
# if [ -d $php56_path/bin ] ; then
#   export PATH="$php56_path/bin:$PATH"
# fi
# if [ -d $php56_path/sbin ] ; then
#   export PATH="$php56_path/sbin:$PATH"
# fi
# 
# sqlite3_path="$BREW_HOME/opt/sqlite"
# if [ -d $sqlite3_path/bin ] ; then
#   export PATH="$sqlite3_path/bin:$PATH"
# fi
# 
# # iTERM
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# 


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --follow'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
# Setting gruvbox colors
export FZF_CTRL_T_OPTS=$FZF_CTRL_T_OPTS'
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
'

# -- ALIASES --

alias ll="exa -l"
alias la="exa -la"
alias lt="exa -T -L 2"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias e="nvim"
alias o="xdg-open"
alias apgs="apg -m 8 -x 12 -s"
# Alias to direct edit of my main taskpaper todo file
# alias todo="cd $HOME/ownCloud/Notes && nvim *.taskpaper"
# Find conflicted copies in NextCloud folder
alias conflicted='cd ~/Nextcloud && find -name "*conflicted*"'

# for Tmux projects
function new-tmux-from-dir-name { tmux new-session -As ${1:-`basename $PWD`} } 
alias tnew="new-tmux-from-dir-name"

# Fuzzy find a file, with colorful preview, then once selected edit it
# Source : https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html
# Ajout: le || return permet de sortir de fzf en pressant ESC
fzf_find_edit() {
    local file=$(
      fzf --no-multi --preview 'bat --color=always --line-range :500 {}' || return
      )
    if [[ -n $file ]]; then
        $EDITOR $file
    fi
}
alias ffe='fzf_find_edit'
bindkey -s '^[e' 'ffe^M' # Alt-e

# Fuzzy find a file, with colorful preview, that contains the supplied term, then once selected edit it
fzf_grep_edit(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        $EDITOR $file +$(echo "$match" | cut -d':' -f2)
    fi
}
alias fge='fzf_grep_edit'

# Weather from wttr.in
alias meteo='curl fr.wttr.in/Rennes'

# Open Street Map in ascii
alias map='telnet mapscii.me'

# protonvpn
alias pvpn='protonvpn-cli'
alias pvpninit='pvpn ks --off && pvpn ks --on && pvpn c -f'

# taskell
alias tasks='taskell ~/Markas/taskell.md'

# taskpaper todos
alias todo="cd ~/Markas && e todo.taskpaper -c 'source todo.vim'"

# aide pour vim
alias learnvim="cd ~/Nextcloud/Documentation/Learn-Vim && e README.md -c 'Goyo'"
# affiche mon fichier d'aide perso
alias help='bat ~/Markas/help.md -p'

# docker-compose
abbrev-alias dcc='sudo docker-compose'
abbrev-alias dccl='sudo docker-compose logs -f --tail=20'

# Utile dans mes projets docker: modification droits fichiers
abbrev-alias dccf='sudo chown fabrice:fabrice -R . && chmod g+w -R .'

source /home/fabrice/.config/broot/launcher/bash/br

# required for cmus
export XDG_CONFIG_HOME=~/.config


# Enable bash completion compatibility
autoload bashcompinit && bashcompinit

# reload completion
autoload -U compinit && compinit

# Startup : launch neofetch or screenfetch
#
# screenfetch
#
# or better, simple, non bloated, written in POSIX sh
# [pfetch](https://github.com/dylanaraps/pfetch)
PF_INFO="ascii title os host kernel uptime pkgs memory de shell editor palette" pfetch
