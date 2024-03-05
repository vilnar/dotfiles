vim9script

# Fix slow O inserts
set timeout timeoutlen=3000 ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden
# keep cursor column position
set nostartofline

set mouse=a

# fix performance for long lines
set nonumber

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
    # hi CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    # hi CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    hi CurSearch gui=reverse cterm=reverse
    hi ExtraWhitespace guibg=#7E8E91
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
    hi CursorLine guibg=#363c4a

    hi ExtraWhitespace guibg=#434C5E
    # hi Comment guifg=#a6acb9
    hi NormalNC guibg=#242832
    hi User1 guifg=#4C566A guibg=#99c276 gui=NONE cterm=NONE
    hi User2 guifg=#4C566A guibg=#64bab1 gui=NONE cterm=NONE

    hi User3 guifg=#4C566A guibg=#d08770 gui=NONE cterm=NONE
    hi User4 guifg=#4C566A guibg=#e5e9f0 gui=NONE cterm=NONE

    hi LineNr guibg=#242832
    hi CursorLineNr guibg=#242832
  }
augroup end

# g:nord_uniform_diff_background = 1
# colorscheme nord
# set background=dark
colorscheme elflord

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
set path=,,
set wildoptions=pum pumheight=20 pumwidth=50
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

