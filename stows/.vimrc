" Starter Pack with vim-opinion installed with Vundle
" and Plugins
" ---------------------------------------------------
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible', !has('nvim') ? {} : { 'on': [] }
Plug 'rstacruz/vim-opinion'
" Plug 'chriskempson/base16-vim'
" Plug 'morhetz/gruvbox', ($TERM_PROGRAM == 'Apple_Terminal') ? {} : { 'on': [] }
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator' 
Plug 'szw/vim-maximizer' " Maximizes and restores the current window
Plug 'Lokaltog/neoranger' " using Ranger as a file drawer
" As described in /usr/share/doc/fzf/README.Debian
" The most straightforward way to use FZF is to append the following line
source /usr/share/doc/fzf/examples/fzf.vim
Plug 'junegunn/fzf.vim' " Add extended support for FZF (search in git files...)
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Goyo' }
Plug 'reedes/vim-pencil'
Plug 'itspriddle/vim-marked'
Plug 'davidoc/taskpaper.vim'
Plug '907th/vim-auto-save'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'ap/vim-css-color'
" Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-liquid'
Plug 'lepture/vim-jinja' " for nunjucks templates
Plug 'elixir-editors/vim-elixir' " configuration files for Elixir
Plug 'slashmili/alchemist.vim' " Elixir integration
Plug 'tpope/vim-rails'
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

" Gruvbox theme
colorscheme gruvbox
set background=dark
let airline_theme='gruvbox'
" See https://github.com/morhetz/gruvbox/wiki/Configuration for more options

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

" Indent Yaml files with 2 spaces instead of \t
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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

" LEADER mappings
" ---------------

let mapleader = ","

" copy/paste to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

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
nnoremap <leader>f :FZF --preview=bat\ --color=always\ --line-range\ :200\ {}<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :Rg<cr>
" Open ranger at current file with "-"
nnoremap <silent> - :RangerCurrentFile<CR>
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
" Neosnippet configuration
" ========================

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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

