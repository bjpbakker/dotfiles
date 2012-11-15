set nocompatible
syntax on

filetype plugin indent on

set shell=bash

set hlsearch
set showmatch
set incsearch
set ignorecase smartcase

set textwidth=0 nosmartindent autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set backspace=indent,eol,start

set showtabline=2

set laststatus=2
set statusline=
set statusline+=%<\                   " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\    " buffer number, and flags
set statusline+=%-40f\                " relative path
set statusline+=%=                    " separate between right and left aligned
set statusline+=%1*%y%*%*\            " file type
set statusline+=%10(L(%l/%L)%)\       " line
set statusline+=%2(C(%v/125)%)\       " column
set statusline+=%P

set number
set ruler
set cursorline

set numberwidth=2
set history=1000
set winwidth=79

set pdev=pdf
set printoptions=paper:a4,syntax:y,wrap:y,duplex:long

colorscheme elflord

