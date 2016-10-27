set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'jedi-vim'

call vundle#end()
    
syntax on

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

if (has("termguicolors"))
 set termguicolors
endif

colorscheme vividchalk

set number
set relativenumber

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
