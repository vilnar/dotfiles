set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "lightsimple"

highlight Comment           cterm=NONE ctermfg=darkblue guifg=#0909BA
highlight Constant          cterm=NONE ctermfg=darkred guifg=#CC46CC
highlight String            cterm=NONE ctermfg=darkred guifg=#CC46CC
" highlight Statement       cterm=NONE ctermfg=black guifg=black
" highlight PreProc	        cterm=NONE ctermfg=black guifg=black
" highlight Type            cterm=NONE ctermfg=black guifg=black
highlight Identifier        cterm=NONE ctermfg=black guifg=black
highlight Function          cterm=NONE ctermfg=black guifg=black
highlight Special           cterm=NONE ctermfg=black guifg=black
highlight Delimiter         cterm=NONE ctermfg=black guifg=black

hi Error  cterm=NONE guifg=#d70000 guibg=NONE gui=NONE
hi ErrorMsg cterm=NONE guifg=#d70000 guibg=NONE gui=NONE
hi ModeMsg cterm=NONE guifg=#1c1c1c guibg=#d7af5f gui=NONE
hi WarningMsg cterm=NONE guifg=#af5f00 guibg=NONE gui=NONE



" highlight Function    cterm=NONE	ctermfg=black
" highlight NonText     ctermfg=darkgrey
" highlight SpecialKey  ctermfg=darkgrey
" highlight DiffAdd     gui=none guifg=bg guibg=Red
" highlight DiffDelete  gui=none guifg=bg guibg=Red
" highlight DiffChange  gui=none guifg=bg guibg=Red
highlight DiffText      gui=none guifg=bg guibg=#AE201E
