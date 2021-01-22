let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1


noremap <M-Left> :bp <CR>
noremap <M-Right> :bn <CR>
noremap <M-Down> :bwipeout <CR>
