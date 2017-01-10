set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
" airline configuration    
set laststatus=2
let g:airline_powerline_fonts=1

syntax on
colorscheme vividchalk

set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent

set number
set relativenumber
set scrolloff=3
set sidescrolloff=5
set incsearch

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

if (has("termguicolors"))
 set termguicolors
endif

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
