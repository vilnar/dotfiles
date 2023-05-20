vim9script

# Fix slow O inserts
set timeout timeoutlen=3000 ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden
# keep cursor column position
set nostartofline

set mouse=a

# Performance for long lines
set nonumber
# let g:loaded_matchparen = 0

set cursorline
set cursorlineopt=number
augroup InsertHl
  autocmd InsertEnter * set cursorlineopt=number,line
  autocmd InsertLeave * set cursorlineopt=number
augroup END


# scroll with wrap, work with CTRL-E, CTRL-Y, mouse
set smoothscroll

if (has("termguicolors"))
  set termguicolors
endif

augroup MyColors
  autocmd ColorScheme default {
    hi CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    hi CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    hi CurSearch gui=reverse cterm=reverse
    hi ExtraWhitespace guibg=#7E8E91
  }
  autocmd ColorScheme gruvbox8 {
    hi link CurSearch IncSearch
    hi gitcommitSummary guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
    # hi Function guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE

    hi Ignore guifg=#8F8F8F
    hi EndOfBuffer guifg=#665c54
    hi NonText guifg=#665c54

    hi ExtraWhitespace guibg=#7c6f64
    hi NormalNC guibg=#32302f
    hi StatusLine guifg=#ebdbb2 guibg=#504945 gui=bold cterm=bold
    hi InsertColor guifg=#B8BB26 guibg=#504945 gui=bold cterm=bold
    hi ImInsertColor guifg=#fabd2f guibg=#504945 gui=bold cterm=bold

    hi DiffAdd    guibg=#464e3b guifg=NONE gui=NONE cterm=NONE
    hi DiffDelete gui=NONE cterm=NONE
    hi DiffChange guibg=#3f4735 guifg=NONE gui=NONE cterm=NONE
    hi DiffText   guibg=#624a12 guifg=NONE gui=bold cterm=bold
  }
  autocmd ColorScheme nord {
    hi link CurSearch IncSearch
    hi link markdownCode String
    hi link markdownCodeBlock String
    hi link markdownCodeDelimiter String
    hi markdownError guibg=#593e4c
    hi link gitcommitSummary SpecialChar

    # hi DiffAdd    guibg=#4c5147 guifg=NONE gui=NONE cterm=NONE
    # hi DiffDelete gui=NONE cterm=NONE
    # hi DiffChange guibg=#534e43 guifg=NONE gui=NONE cterm=NONE
    # hi DiffText   guibg=#593e4c guifg=NONE gui=bold cterm=bold

    hi Ignore guifg=#616E88
    hi EndOfBuffer guifg=#616E88

    hi ExtraWhitespace guibg=#616E88
    # hi Comment guifg=#a6acb9
    hi NormalNC guibg=#242832
    hi InsertColor guifg=#D8DEE9 guibg=#525d48
    hi ImInsertColor guifg=#3B4252 guibg=#8d8758

    hi LineNr guibg=#242832
    hi CursorLineNr guibg=#242832
  }
  autocmd ColorScheme zenburn {
    hi link CurSearch IncSearch
    hi link markdownCode String
    hi link markdownCodeBlock String
    hi link markdownCodeDelimiter String
    hi Boolean guifg=#8cd0d3
    hi PreProc gui=NONE cterm=NONE
    hi Define gui=NONE cterm=NONE
    hi StorageClass gui=NONE cterm=NONE

    hi link diffAdded Comment
    hi link diffRemoved String
    hi link diffChanged Number
    hi DiffAdd    guifg=NONE gui=NONE cterm=NONE
    hi DiffText   guibg=#57474f guifg=NONE gui=NONE cterm=NONE

    # hi SpecialKey guibg=NONE

    hi Ignore guifg=#8F8F8F

    hi ExtraWhitespace guibg=#797979
    hi NormalNC guibg=#2F2F2F
    hi InsertColor guifg=#dfdfdf guibg=#313633 gui=bold cterm=bold
    hi ImInsertColor guifg=#8CB0D3 guibg=#313633 gui=bold cterm=bold
  }
augroup end

g:gruvbox_italics = 0
set background=dark
# colorscheme gruvbox8

g:nord_uniform_diff_background = 1
colorscheme nord


g:zenburn_alternate_Visual = 1
g:zenburn_high_Contrast = 1
g:zenburn_disable_Label_underline = 1
g:zenburn_disable_bold_CursorBars = 1
# colorscheme zenburn

# colorscheme desert
# colorscheme default
# set background=light


# different color depending on focus
# augroup WinBg
#     autocmd WinEnter,BufEnter * setlocal wincolor=
#     autocmd WinLeave,BufLeave * setlocal wincolor=NormalNC
# augroup end



# set linebreak
set showbreak=->
set nowrap
# set wrap
set linebreak   # wrap lines at convenient points
set breakindent # wrap lines such that vertical indent is not broken

set history=1000
set wildmenu wildmode=full
set wildignorecase
set wildoptions=pum pumheight=20
set shortmess-=S
set showcmd
# set complete=.,b,u,t
# set complete=.,t
set complete=.,w

set splitbelow
# set splitright
set title

set confirm


set display+=truncate

if !has('gui_running')
  &t_SI = "\<esc>[5 q"
  &t_SR = "\<esc>[3 q"
  &t_EI = "\<esc>[1 q"

# 0  -> blinking block.
# 1  -> blinking block (default).
# 2  -> steady block.
# 3  -> blinking underline.
# 4  -> steady underline.
# 5  -> blinking bar (xterm).
# 6  -> steady bar (xterm).

  if &term =~ '^\%(alacritty\)'
    &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  if &term == 'xterm-kitty'
    &t_ut = ''
  endif
endif

