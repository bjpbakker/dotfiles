" This is Bart Bakker's .vimrc

autocmd!

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

filetype off

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \    },
            \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplcache.vim'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'mileszs/ack.vim'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'kien/rainbow_parentheses.vim'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 't9md/vim-ruby-xmpfilter'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'cypok/vim-sml'
NeoBundle 'wlangstroth/vim-racket'
NeoBundle 'moll/vim-node'
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'rizzatti/dash.vim'

NeoBundle 'editorconfig/editorconfig-vim'

filetype plugin indent on
syntax on

" Allow unsaved background buffers (with marks/undo for them).
set hidden
set history=10000
set autoindent tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
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

" Open split panes at more natural positions
set splitbelow
set splitright

set t_Co=256
set background=dark
colorscheme brt

" Who needs backups.
set nobackup
set nowritebackup

" Move swap files out of the way - but preserve original folder structure
set directory=~/.tmp//

" disable annoying beeps
set visualbell
set noerrorbells

set showcmd
set wildmode=longest,list
set wildmenu

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

" CtrlP
let g:ctrlp_map = '' " <c-p> binding conflicts with Vim default <c-p> for previous
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
if executable('ag')
    let g:ctrlp_user_command = 'ag %s --files-with-matches --hidden --ignore .git/ --nocolor -g ""'
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_show_hidden = 1
endif

" Ack should use ag
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

nnoremap <leader>g :GitGutterToggle<cr>

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_enable_signs=1
nnoremap <silent> <leader>e :SyntasticCheck<cr>:Errors<cr>

" JavaScript
let g:syntastic_javascript_checkers = ['closurecompiler']
let g:syntastic_javascript_closurecompiler_script = 'closure-compiler'

" Dash
nnoremap <c-x><c-d> :Dash<cr>

" ctags are kept in .tags
set tags+=.tags

" insert UUID at cursor in insert mode
inoremap <expr> <c-r>!uuid GenUuid()

" neocomplcache
inoremap <expr><c-g> neocomplcache#undo_completion()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

augroup vimrcEx
    autocmd!

    autocmd VimEnter * call s:Initialize()

    " Don't map <Enter> when in command windows since it's used to run
    " commands there
    autocmd! CmdwinEnter * :unmap <cr>
    autocmd! CmdwinLeave * :call MapCR()

    " Rainbow parentheses
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax clojure call s:RainbowParenthesesLoad()

    autocmd FileType c setlocal noexpandtab
    autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

    autocmd FileType xml setlocal formatprg=xmllint\ --format\ -
augroup END

function! MapCR()
    nnoremap <cr> :write<cr>
endfunction
call MapCR()

function! s:RainbowParenthesesLoad()
  RainbowParenthesesLoadRound
  RainbowParenthesesLoadSquare
  RainbowParenthesesLoadBraces
endfunction

function! s:Initialize()
    GitGutterDisable
    " Syntastic starts in active mode, switch to passive
    silent SyntasticToggleMode
endfunction

function! GenUuid()
    return substitute(system('uuid'), '\n$', '', '')
endfunction

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

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Work with quickfix lists
nnoremap <silent> <leader>j :exe (GetListPrefix() . "next")<cr>
nnoremap <silent> <leader>k :exe (GetListPrefix() . "prev")<cr>
nnoremap <silent> <leader>J :exe (GetListPrefix() . "last")<cr>
nnoremap <silent> <leader>K :exe (GetListPrefix() . "first")<cr>

function! GetListPrefix()
    return ! empty(getloclist(0)) ? 'l' : ! empty(getqflist()) ? 'c' : 'b'
endfunction

" XMPFilter bindings
nmap <buffer> <c-x><c-m> <Plug>(xmpfilter-mark)
xmap <buffer> <c-x><c-m> <Plug>(xmpfilter-mark)
imap <buffer> <c-x><c-m> <Plug>(xmpfilter-mark)
nmap <buffer> <c-x><c-e> <Plug>(xmpfilter-run)
xmap <buffer> <c-x><c-e> <Plug>(xmpfilter-run)
imap <buffer> <c-x><c-e> <Plug>(xmpfilter-run)

set pdev=pdf
set printoptions=paper:a4,syntax:y,wrap:y,duplex:long

