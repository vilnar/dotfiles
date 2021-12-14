set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "darksimple"

highlight Comment       cterm=NONE ctermfg=grey guifg=grey
" highlight LineNr        cterm=NONE ctermfg=darkgrey guifg=darkgrey
highlight LineNr        cterm=NONE ctermbg=darkgrey ctermfg=white
highlight Constant      cterm=NONE ctermfg=magenta guifg=magenta
highlight String        cterm=NONE ctermfg=magenta guifg=magenta

highlight CursorLine    cterm=NONE ctermbg=16 guibg=#2c323c
highlight CursorLineNr  cterm=NONE ctermbg=16 guibg=#2c323c ctermfg=145 guifg=#abb2bf

" highlight Statement       cterm=NONE ctermfg=white guifg=white
" highlight PreProc         cterm=NONE ctermfg=white guifg=white
" highlight Type            cterm=NONE ctermfg=white guifg=white

highlight Identifier        cterm=NONE ctermfg=white guifg=white
highlight Function          cterm=NONE ctermfg=white guifg=white
" highlight Special           cterm=NONE ctermfg=white guifg=white
" highlight Delimiter         cterm=NONE ctermfg=white guifg=white

" highlight CursorLine   cterm=NONE ctermbg=darkblue ctermfg=NONE
