set background=light
highlight clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "simplelight"

hi Comment    cterm=NONE ctermfg=darkblue gui=none guifg=darkblue
hi String    cterm=NONE ctermfg=darkred gui=none guifg=darkred
hi Constant   cterm=NONE ctermfg=darkred guifg=darkred
hi Identifier cterm=NONE ctermfg=black guifg=black
hi Function   cterm=NONE ctermfg=black guifg=black
hi Statement  cterm=NONE ctermfg=black guifg=black
hi PreProc    cterm=NONE ctermfg=black guifg=black
hi Type	      cterm=NONE ctermfg=black guifg=black
hi Special    cterm=NONE ctermfg=black guifg=black
hi Delimiter  cterm=NONE ctermfg=black guifg=black



" highlight Function	cterm=NONE	ctermfg=black
" highlight phpVarSelector	cterm=NONE	ctermfg=darkcyan
" highlight NonText ctermfg=darkgrey
" highlight SpecialKey ctermfg=darkgrey
" highlight DiffAdd    gui=none guifg=bg guibg=Red
" highlight DiffDelete gui=none guifg=bg guibg=Red
" highlight DiffChange gui=none guifg=bg guibg=Red
highlight DiffText   gui=none guifg=bg guibg=#AE201E
