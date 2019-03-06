CHEATSHEET
==========


Vim
---


" Delete current buffer without closing the window

    <Leader>q

" Move to the next buffer

    <leader>l

" Move to the previous buffer

    <leader>h 

" Move to previous opened buffer

    <C-^>

" will switch to buffer number 5
    
    5<C-^>

" Zoom in/out current split (with maximizer plugin)

    <leader>m

" In terminal, get out insert mode (back to normal)

    <leader><esc>

" FZF

    <leader>f :Files
    <leader>g :GFiles (git ls-files)
    <leader>b :Buffers

  (multi)select :
    toggle with <TAB>

" Ranger (file drawer)

    <leader>r :Ranger (ouvrir Ranger dans un buffer terminal neovim) 

" Goyo

    <leader>z

" Nerd Commenter

    <leader>cc Comment current line or selected lines
    <leader>cu Uncomment
    <leader>cm Minimal : Comments the selected lines using one set of multipart delimiters if possible.
    <leader>space Toggle

" Tabular

    <leader>a= (:Tab /=) Align on = separator
    <leader>a: (:Tab /:) Align on : separator

or see <http://vimcasts.org/episodes/aligning-text-with-tabular-vim/>


Terminal
--------

    vim $(fzf) #open a file in vim with fzf
