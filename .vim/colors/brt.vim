" Based on IR Black
" Inspired by Gary Bernhardt's grb256 schema
runtime colors/ir_black.vim

let g:colors_name = "brt"

hi StatusLineNC ctermbg=black ctermfg=lightgrey
hi CursorLine ctermbg=234
hi Function ctermfg=yellow
hi Visual ctermbg=236 cterm=NONE
hi Error ctermfg=16
hi ErrorMsg ctermfg=16
hi WarningMsg ctermfg=16
hi SpellBad guifg=white guibg=#FF6C60 gui=BOLD ctermfg=16 ctermbg=160 cterm=NONE
" IR Black doesn't highlight operators for some reason
hi Operator guifg=#6699CC guibg=NONE gui=NONE ctermfg=lightblue ctermbg=NONE cterm=NONE

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

highlight PmenuSel ctermfg=16 ctermbg=156

