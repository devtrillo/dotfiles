source $HOME/.config/nvim/settings.vim 

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
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update', g:plug_home)
    if filereadable(l:filename) == 0
      call writefile([], l:filename)
    endif

    let l:this_week = strftime('%Y_%V')
    let l:contents = readfile(l:filename)
    if index(l:contents, l:this_week) < 0
      call execute('PlugUpdate')
      call execute('PlugUpgrade')
      call writefile([l:this_week], l:filename, 'a')
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()

call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'} 
	Plug 'ap/vim-css-color'
  Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'mattn/vim-sonictemplate'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Configuration script plugins/fugitive.vim
  Plug 'tpope/vim-fugitive'
  " Configuration script plugins/fzf.vim
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  " Configuration script plugins/startify
  Plug 'mhinz/vim-startify'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'vimwiki/vimwiki'
  Plug 'tpope/vim-eunuch'
  Plug 'wakatime/vim-wakatime'

call plug#end()


" ==============================
" plugins section
" ==============================
source $HOME/.config/nvim/plugins/fzf.vim 
source $HOME/.config/nvim/plugins/fugitive.vim 
source $HOME/.config/nvim/plugins/coc.vim 
source $HOME/.config/nvim/plugins/strartify.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/vim-wiki.vim
