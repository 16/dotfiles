" Starter Pack with vim-opinion installed with Vundle
" and Plugins
" ---------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Basics
Plugin 'tpope/vim-sensible'
Plugin 'rstacruz/vim-opinion'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'reedes/vim-pencil'
Plugin 'mattn/emmet-vim'
Plugin 'slim-template/vim-slim.git'

call vundle#end()
filetype plugin indent on


" BASICS
" ------
" Making the clipboard work between iTerm2, and vim
set clipboard=unnamed

" Explicitly set encoding
if !has('nvim')
  set encoding=utf-8
endif
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
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab opened.
let g:airline#extensions#tabline#enabled = 1

" NeoVim specifics
" ----------------
if has('nvim')
  let g:python_host_prog = '/usr/local/bin/python'
endif

" FZF
" ---
set rtp+=/usr/local/opt/fzf

" LEADER mappings
" ---------------

let mapleader = ","

" Delete current buffer without closing the window
nmap <silent> <leader>q :bp\|bd #<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" FZF
nnoremap <leader>f :FZF<cr>

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

" Writing environment
" -------------------
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#spell#enabled = 0

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Highlight current line
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1
