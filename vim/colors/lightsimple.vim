set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lightsimple"

highlight Comment           cterm=NONE ctermfg=DarkBlue guifg=DarkBlue
highlight Constant          cterm=NONE ctermfg=DarkRed guifg=DarkRed
highlight String            cterm=NONE ctermfg=DarkRed guifg=DarkRed
highlight Identifier        cterm=NONE ctermfg=Black guifg=Black
highlight Function          cterm=NONE ctermfg=Black guifg=Black
highlight Special           cterm=NONE ctermfg=DarkMagenta guifg=DarkMagenta
highlight Delimiter         cterm=NONE ctermfg=Black guifg=Black

highlight Statement         cterm=NONE ctermfg=DarkYellow guifg=#AA5500 gui=NONE
" highlight PreProc    cterm=NONE ctermfg=black guifg=black
" highlight Type            cterm=NONE ctermfg=black guifg=black

highlight PmenuSel          cterm=NONE ctermbg=Grey ctermfg=NONE guifg=NONE guibg=Grey

highlight Visual            cterm=NONE ctermbg=Grey guibg=Grey

highlight CursorLine        cterm=NONE ctermbg=254 ctermfg=NONE guifg=NONE guibg=#f0f0f0
highlight CursorColumn      cterm=NONE ctermbg=254 ctermfg=NONE guifg=NONE guibg=#f0f0f0

highlight LineNr            cterm=none ctermfg=Black ctermbg=254 guifg=Black guibg=#f0f0f0
highlight CursorLineNr      cterm=bold ctermfg=Black ctermbg=White guifg=Black guibg=White gui=bold

highlight Error             cterm=strikethrough ctermfg=Magenta ctermbg=White guifg=Magenta guibg=White gui=strikethrough
highlight ErrorMsg          cterm=NONE ctermfg=White ctermbg=DarkRed guifg=White guibg=#d70000 gui=NONE
highlight ModeMsg           cterm=NONE guifg=#1c1c1c guibg=#d7af5f gui=NONE
highlight WarningMsg        cterm=NONE guifg=#af5f00 guibg=NONE gui=NONE


" highlight NonText         ctermfg=darkgrey
" highlight SpecialKey      ctermfg=darkgrey
" highlight DiffAdd         gui=none guifg=bg guibg=Red
" highlight DiffDelete      gui=none guifg=bg guibg=Red
" highlight DiffChange      gui=none guifg=bg guibg=Red
highlight DiffText          ctermfg=Black ctermbg=DarkRed gui=none guifg=Black guibg=#AE201E
