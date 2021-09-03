set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "lightsimple"

highlight Comment           cterm=NONE ctermfg=darkblue gui=none guifg=darkblue
highlight Constant          cterm=NONE ctermfg=darkred guifg=darkred
highlight String            cterm=NONE ctermfg=darkred gui=none guifg=darkred
" highlight Statement       cterm=NONE ctermfg=black guifg=black
" highlight PreProc	        cterm=NONE ctermfg=black guifg=black
" highlight Type            cterm=NONE ctermfg=black guifg=black
highlight Identifier        cterm=NONE ctermfg=black guifg=black
highlight Function          cterm=NONE ctermfg=black guifg=black
highlight Special           cterm=NONE ctermfg=black guifg=black
highlight Delimiter         cterm=NONE ctermfg=black guifg=black



" highlight Function    cterm=NONE	ctermfg=black
" highlight NonText     ctermfg=darkgrey
" highlight SpecialKey  ctermfg=darkgrey
" highlight DiffAdd     gui=none guifg=bg guibg=Red
" highlight DiffDelete  gui=none guifg=bg guibg=Red
" highlight DiffChange  gui=none guifg=bg guibg=Red
highlight DiffText      gui=none guifg=bg guibg=#AE201E
