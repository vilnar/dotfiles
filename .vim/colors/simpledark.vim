set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "simpledark"

hi Comment    cterm=NONE ctermfg=cyan gui=none guifg=cyan
hi Constant   cterm=NONE ctermfg=magenta guifg=magenta
hi Identifier cterm=NONE ctermfg=white guifg=white
hi Function   cterm=NONE ctermfg=white guifg=white
hi Statement  cterm=NONE ctermfg=white guifg=white
hi PreProc    cterm=NONE ctermfg=white guifg=white
hi Type	      cterm=NONE ctermfg=white guifg=white
hi Special    cterm=NONE ctermfg=white guifg=white
hi Delimiter  cterm=NONE ctermfg=white guifg=white



" highlight Comment	cterm=NONE	ctermfg=DarkCyan
" highlight Identifier	cterm=NONE	ctermfg=White
" highlight phpVarSelector	cterm=bold	ctermfg=cyan
" highlight Function	cterm=NONE	ctermfg=NONE
