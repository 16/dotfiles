" Starter Pack with vim-opinion installed with Vundle
" and Plugins
" ---------------------------------------------------
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible', !has('nvim') ? {} : { 'on': [] }
Plug 'rstacruz/vim-opinion'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox', ($TERM_PROGRAM == 'Apple_Terminal') ? {} : { 'on': [] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator' 
Plug 'szw/vim-maximizer' " Maximizes and restores the current window
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fzf installed with Homebrew
Plug 'Lokaltog/neoranger', { 'branch': 'develop' } " using Ranger as a file drawer
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'reedes/vim-pencil'
Plug 'itspriddle/vim-marked'
Plug 'davidoc/taskpaper.vim'
Plug '907th/vim-auto-save'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter' 
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'ap/vim-css-color'
" Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mattn/emmet-vim'
Plug 'lepture/vim-jinja' " for nunjucks templates
Plug 'elixir-editors/vim-elixir' " configuration files for Elixir
Plug 'slashmili/alchemist.vim' " Elixir integration
call plug#end()


" BASICS
" ------
" Making the clipboard work between iTerm2, and vim
set clipboard=unnamed

" Explicitly set encoding
if !has('nvim')
  set encoding=utf-8
endif
set termencoding=utf-8

" Highlight current line
set cursorline

if ($TERM_PROGRAM == 'Apple_Terminal')
  " for osx terminal.app
  colorscheme gruvbox
  set background=dark
  let airline_theme='gruvbox'
else
  " BASE16 Color switching
  " ----------------------
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
    let airline_theme='base16'
  endif
endif

" SPLITS
" ------
" Open new split panes to right and bottom, which feels more natural than
" Vim’s default
" ( https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally )
set splitbelow
set splitright

if has('nvim')
  highlight TermCursor ctermfg=red guifg=red
endif

" To resize vim splits in tmux
if !has('nvim')
  set ttymouse=xterm2
endif

" Zooming with Maximizer
let g:maximizer_set_default_mapping = 0
nmap <silent><Leader>m :MaximizerToggle<CR>

" Terminal settings
" -----------------
" (NeoVim)
" Source: <https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9>
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
  call s:mapMoveToWindowInDirection(dir)
endfor

" SOFT WRAP
" ---------
set formatoptions=1
set wrap
set linebreak
set nolist

" AIRLINE
" -------
set noshowmode " because mode info is shown in Airline
let g:airline_theme=airline_theme
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab opened.
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = '%{PencilMode()}'

" It's useful to show the buffer number in the status line.
let g:airline#extensions#tabline#buffer_nr_show = 1

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

" Toggle paste mode on and off
" (see: http://vimcasts.org/episodes/using-vims-paste-mode-with-the-system-paste-command/)
" (Use C-c to exit paste mode in insert mode)
map <leader>pp :setlocal paste!<cr>

" FZF
nnoremap <leader>f :FZF<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :Rg<cr>

" Open ranger in current working directory
nnoremap <silent> <Leader>r :Ranger<CR>


" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif

" Writing environment
" -------------------

" On OSX, use Marked version 1 to preview markdown
let g:marked_app = "Marked"

" open .txt files as markdown
autocmd BufRead *.txt set ft=markdown

let g:pandoc#filetypes#handled = ["pandoc", "markdown", "extra"]
let g:pandoc#filetypes#pandoc_markdown = 0
" let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["bibliographies", "spell"]
let g:pandoc#keyboard#sections#header_style = 's' " enables setext headers for level 1 and 2 headers

let g:pencil#wrapModeDefault = 'soft'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
let g:pencil#textwidth = 79

let g:limelight_default_coefficient = 0.4
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set scrolloff=999
  "Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set scrolloff=5
  "Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Autosave taskpaper files
autocmd filetype taskpaper let g:auto_save = 1

" Automatically causes vim to reload taskpaper files which have been written on disk but
" not modified in the buffer since the last write from vim.
" This enables a file open in vim to be edited using another application and saved.
" See https://vi.stackexchange.com/a/14833
autocmd filetype taskpaper set autoread | au CursorHold * checktime | call feedkeys("lh")

"
" Deoplete Omni Completion
" ========================

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" In insert mode, activate with normal omni completion keys <crtl-x> <ctrl-o>

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"
" NERD Commenter options
" ========================

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'both'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

