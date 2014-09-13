" This is Bart Bakker's .vimrc

autocmd!

call pathogen#infect()

set nocompatible
" Allow unsaved background buffers (with marks/undo for them).
set hidden
set history=10000
set autoindent tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set backspace=indent,eol,start

set hlsearch
set showmatch
set incsearch
set ignorecase smartcase

set switchbuf=useopen

set cursorline
" Keep some context when scrolling off the end of a buffer.
set scrolloff=3
set winwidth=79
set number
set numberwidth=2
set laststatus=2
set showtabline=2
set ruler
set cmdheight=1
set foldmethod=manual
set nofoldenable

set t_Co=256
set background=dark
colorscheme brt

" Who needs backups.
set nobackup
set nowritebackup

set showcmd
set wildmode=longest,list
set wildmenu

syntax on
filetype plugin indent on

let mapleader=","
" Fix slow O inserts.
set timeout timeoutlen=1000 ttimeoutlen=100
" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

set modeline
set modelines=3
" Insert only one space when joining lines that contain sentence-terminating
" punctuation like '.'.
set nojoinspaces
" If a file is changed outside of Vim, reload without asking
set autoread

" Invisible characters
set listchars=trail:.,tab:>-,eol:$
set nolist
noremap <Leader>i :set list!<cr>

" Ignore files in .git/, swp files, build output files, etc
set wildignore=.git,.*.swp

" Append Git ignore patterns to wildignore.
" This only works for patterns in the root .gitignore.
function! s:WildignoreFromGitignore()
    let git_root = fnamemodify(fugitive#extract_git_dir('%:p'), ':h')
    let gitignore = git_root . '/.gitignore'
    if (filereadable(gitignore))
        let ignores = ''
        for line in readfile(gitignore)
            let ignored = substitute(line, '\s|\n', '', 'g')
            if ignored =~ '^#|$' | con | endif " Skip comments and empty lines
            if ignored =~ '^!' | con | endif " Vim supports no negative ignores
            if ignored =~ '^/.\+' | let ignored = substitute(ignored, '^/', '*/', 'g') | endif
            if ignored =~ '/$' | let ignored = substitute(ignored, '/$', '', 'g') | endif
            let ignores .= (empty(ignores) ? '' : ",") . ignored
        endfor
        let set_wildignore = "set wildignore+=" . ignores
        execute set_wildignore
    endif
endfunction

command! WildignoreFromGitignore :call <SID>WildignoreFromGitignore()

" CtrlP
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
if executable('ag')
    let g:ctrlp_user_command = 'ag %s --files-with-matches --hidden --nocolor -g ""'
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_show_hidden = 1
endif

augroup vimrcEx
    autocmd!
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax clojure call s:RainbowParenthesesLoad()
augroup END

function s:RainbowParenthesesLoad()
  RainbowParenthesesLoadRound
  RainbowParenthesesLoadSquare
  RainbowParenthesesLoadBraces
endfunction

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" XMPFilter bindings
nmap <buffer> <c-x><c-m> <Plug>(xmpfilter-mark)
xmap <buffer> <c-x><c-m> <Plug>(xmpfilter-mark)
imap <buffer> <c-x><c-m> <Plug>(xmpfilter-mark)
nmap <buffer> <c-x><c-e> <Plug>(xmpfilter-run)
xmap <buffer> <c-x><c-e> <Plug>(xmpfilter-run)
imap <buffer> <c-x><c-e> <Plug>(xmpfilter-run)

set pdev=pdf
set printoptions=paper:a4,syntax:y,wrap:y,duplex:long

