set syntax
set tabstop=2 shiftwidth=2 expandtab
set number relativenumber
set nohlsearch

" ==============================
" In case vim plug is not installed
" ==============================
if empty (glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================
" Run PlugUpdate every week automatically when entering Vim.
" ==============================

function! OnVimEnter() abort
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpgrade')
      call execute('PlugUpdate')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()

call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'mattn/vim-sonictemplate'
call plug#end()

let g:coc_global_extensions=["coc-json", "coc-tsserver"]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>

" ==============================
" FZF plugin
" ==============================
source $HOME/.config/nvim/plugins/fzf.vim 
