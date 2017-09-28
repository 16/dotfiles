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

" FZF
  <leader>f 

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
