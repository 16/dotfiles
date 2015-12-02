"" Starter Pack with vim-opinion installed with Vundle
"" and Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-sensible'
Plugin 'rstacruz/vim-opinion'
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on

" BASE16 Color switching
" ----------------------
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"" Now, personnal settings
" Making the clipboard work between iTerm2, and vim
set clipboard=unnamed

" Explicitly set encoding
set encoding=utf-8
set termencoding=utf-8
  
  
" SPLITS
" ------
" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
" ( https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally )
set splitbelow
set splitright

" To resize vim splits in tmux
set ttymouse=xterm2

" SOFT WRAP
" ---------
set formatoptions=1
set wrap
set linebreak
set nolist

