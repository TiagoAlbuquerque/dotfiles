set nocompatible

"""---Vundle settings---"""{{{
filetype off "required by Vundle
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
filetype on
"}}}

"""---General Configurations---"""{{{
    
    set backspace=indent,eol,start

    set encoding=utf8
    set number
    set relativenumber
    
    syntax on
    colorscheme vividchalk

    autocmd Filetype * setlocal foldmethod=marker
    
    set scrolloff=5
    set sidescrolloff=10
    set ttimeout
    set ttimeoutlen=100
    
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    if (has("termguicolors"))
        set termguicolors
    endif

    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"}}}

"""---Persistent Undo---""""{{{
" Keep undo history across sessions, by storing in file
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups >/dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif
"}}}

"""---Make tabs, trailing whitespaces, and non-breaking spaces visible---"""{{{
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
    set list   
"}}}

"""---Auto erase trailing whitespaces---""""{{{
autocmd BufWritePre * %s/\s\+$//e
"}}}

"""---Set up smarter search behaviour---"""{{{
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used

nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

function! HLNext(blinktime)
    let [bufnum, lnum, col, off] =getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let blinks = 3
    for n in range(1,blinks)
        let red = matchadd('ColorColumn', target_pat, 101)
        redraw
        exec 'sleep' . float2nr(a:blinktime/(2*blinks) * 1000) . 'm'
        call matchdelete(red)
        redraw
        exec 'sleep' . float2nr(a:blinktime/(2*blinks) * 1000) . 'm'
    endfor
endfunction
"}}}

"""---Make the 121st column stand out---"""{{{
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn','\%121v',100) 
"}}}

"""---Fix smartindent stupidities---"""{{{

    set tabstop=4
    set expandtab
    set smarttab
    set shiftwidth=4
    set cindent
set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks

inoremap # X<C-H>#|                         "And no magic outdent for comments
nnoremap <silent> >> :call ShiftLine()<CR>| "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction

"}}}

"""---Automaticaly reload vimrc on saving---"""{{{
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
"}}}

"""---Plugin Specific configurations---"""{{{
    
" airline configuration {{{
set laststatus=2
let g:airline_powerline_fonts=1
let airline_powerline_fonts=1
"}}}

"}}}
