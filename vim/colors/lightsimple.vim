highlight clear
set background=light
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lightsimple"

highlight Normal            cterm=NONE ctermfg=Black ctermbg=White guibg=#FFFFDF
highlight Comment           cterm=NONE ctermfg=DarkRed guifg=DarkRed
highlight Constant          cterm=NONE ctermfg=DarkGreen guifg=DarkGreen
highlight String            cterm=NONE ctermfg=DarkGreen guifg=DarkGreen
highlight Identifier        cterm=NONE ctermfg=Black guifg=Black
highlight Function          cterm=NONE ctermfg=Black guifg=Black
highlight Special           cterm=NONE ctermfg=DarkMagenta guifg=DarkMagenta
highlight Delimiter         cterm=NONE ctermfg=Black guifg=Black

highlight Statement         cterm=NONE ctermfg=Black guifg=Black gui=NONE
highlight PreProc           cterm=NONE ctermfg=black guifg=black
highlight Type              cterm=NONE ctermfg=black guifg=black

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

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[0] = "#000000"
  let g:terminal_ansi_colors[8] = "#555555"

  let g:terminal_ansi_colors[1] = "#B30000"
  let g:terminal_ansi_colors[9] = "#DA6969"

  let g:terminal_ansi_colors[2] = "#086708"
  let g:terminal_ansi_colors[10] = "#2A9C2A"

  let g:terminal_ansi_colors[3] = "#AA5500"
  let g:terminal_ansi_colors[11] = "#DFDF3D"

  let g:terminal_ansi_colors[4] = "#325CC0"
  let g:terminal_ansi_colors[12] = "#BFDBFE"

  let g:terminal_ansi_colors[5] = "#A04B73"
  let g:terminal_ansi_colors[13] = "#7B2B5E"

  let g:terminal_ansi_colors[6] = "#347878"
  let g:terminal_ansi_colors[14] = "#67E0E0"

  let g:terminal_ansi_colors[7] = "#FFFFDF"
  let g:terminal_ansi_colors[15] = "#FFFFFF"
endif
