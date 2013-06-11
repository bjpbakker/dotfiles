call pathogen#runtime_append_all_bundles()

set nocompatible
syntax on
filetype plugin indent on
set background=light
colorscheme solarized

set shell=bash

set hlsearch
set showmatch
set incsearch
set ignorecase smartcase

set textwidth=0 nosmartindent autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set backspace=indent,eol,start

set showtabline=2

set laststatus=2

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

set number
set ruler
set cursorline

set numberwidth=2
set history=1000
set winwidth=79

set pdev=pdf
set printoptions=paper:a4,syntax:y,wrap:y,duplex:long

" fix cursor in tmux
" -> tmux only forwards escape sequences to the terminal if surrounded by a DCS sequence
" more details at http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

