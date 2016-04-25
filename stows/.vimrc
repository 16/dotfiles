" Starter Pack with vim-opinion installed with Vundle
" and Plugins
" ---------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'tpope/vim-sensible'
Plugin 'rstacruz/vim-opinion'
Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'

call vundle#end()
filetype plugin indent on


" BASICS
" ------
" Making the clipboard work between iTerm2, and vim
set clipboard=unnamed

" Explicitly set encoding
set encoding=utf-8
set termencoding=utf-8


" BASE16 Color switching
" ----------------------
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

  
" SPLITS
" ------
" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
" ( https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally )
set splitbelow
set splitright

" To resize vim splits in tmux
if !has('nvim')
  set ttymouse=xterm2
endif

" SOFT WRAP
" ---------
set formatoptions=1
set wrap
set linebreak
set nolist

" AIRLINE
" -------
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab opened.
let g:airline#extensions#tabline#enabled = 1

