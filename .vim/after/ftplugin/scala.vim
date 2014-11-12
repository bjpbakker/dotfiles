if exists('g:loaded_neocomplcache')
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    NeoComplCacheEnable
endif

if exists("g:loaded_syntastic_plugin")
    let g:scala_use_default_keymappings = 0
    let g:syntastic_scala_checkers = ['fsc']
endif

augroup ScalaEx
    au Syntax scala call s:InitScalaBuffer()
augroup END

function! s:InitScalaBuffer()
    if globpath(&rtp, 'plugin/rainbow_parentheses.vim') != ''
        RainbowParenthesesLoadRound
        RainbowParenthesesLoadSquare
        RainbowParenthesesLoadBraces
    endif
endfunction
