" Based on IR Black
" Inspired by Gary Bernhardt's grb256 schema
runtime colors/ir_black.vim

let g:colors_name = "brt"

hi StatusLineNC ctermbg=black ctermfg=lightgrey
hi CursorLine ctermfg=NONE ctermbg=234 cterm=NONE
hi Function ctermfg=yellow
hi Visual ctermbg=236 cterm=NONE
hi Error ctermfg=darkgrey ctermbg=red cterm=underline
hi ErrorMsg ctermfg=darkgrey ctermbg=red cterm=BOLD
hi WarningMsg ctermfg=darkgrey ctermbg=red cterm=BOLD
hi SpellBad ctermfg=darkgrey ctermbg=160 cterm=BOLD
" IR Black doesn't highlight operators for some reason
hi Operator ctermfg=lightblue ctermbg=NONE cterm=NONE

hi SignColumn ctermbg=234

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

highlight PmenuSel ctermfg=16 ctermbg=156

