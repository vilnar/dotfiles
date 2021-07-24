set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "darksimple"

highlight Comment		cterm=NONE ctermfg=cyan guifg=cyan
highlight Constant		cterm=NONE ctermfg=magenta guifg=magenta
highlight String		cterm=NONE ctermfg=magenta guifg=magenta
highlight MatchParen		cterm=NONE ctermbg=blue ctermfg=yellow
" highlight Statement		cterm=NONE ctermfg=white guifg=white
" highlight PreProc		cterm=NONE ctermfg=white guifg=white
" highlight Type			cterm=NONE ctermfg=white guifg=white
highlight Identifier		cterm=NONE ctermfg=white guifg=white
highlight Function		cterm=NONE ctermfg=white guifg=white
highlight Special		cterm=NONE ctermfg=white guifg=white
highlight Delimiter		cterm=NONE ctermfg=white guifg=white
highlight phpVarSelector	cterm=NONE ctermfg=white guifg=white
