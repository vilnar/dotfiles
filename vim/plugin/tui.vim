vim9script

import "../lib/statusline.vim" as statusline

# Fix slow O inserts
set ttimeout
set ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden
# keep cursor column position
set nostartofline

set autoread

set mouse=a

set number
# set number relativenumber
# set cursorcolumn
# set signcolumn=number
# set numberwidth=6
set cursorline
set cursorlineopt=number
augroup InsertHl
  autocmd InsertEnter * set cursorlineopt=number,line
  autocmd InsertLeave * set cursorlineopt=number
augroup END

# horizontal scroll
set sidescroll=1
set sidescrolloff=2

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
    hi CurSearch guifg=#1D2021 guibg=#fe8019
    hi gitcommitSummary guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
    # hi Function guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE

    hi Ignore guifg=#8F8F8F
    hi link DirvishGitIgnored Ignore

    hi ExtraWhitespace guibg=#7c6f64
    hi NormalNC guibg=#32302f
    hi InsertColor guifg=#282828 guibg=#83a598
    hi ImInsertColor guifg=#282828 guibg=#D79921

    hi DiffAdd    guibg=#59644c guifg=NONE gui=NONE cterm=NONE
    hi DiffDelete gui=NONE cterm=NONE
    hi DiffChange guibg=#445a3d guifg=NONE gui=NONE cterm=NONE
    hi DiffText   guibg=#846418 guifg=NONE gui=bold cterm=bold
  }
augroup end

g:gruvbox_italics = 0
set background=dark
colorscheme gruvbox8

# colorscheme desert
# colorscheme default
# set background=light


# different color depending on focus
augroup WinBg
    autocmd WinEnter,BufEnter * setlocal wincolor=
    autocmd WinLeave,BufLeave * setlocal wincolor=NormalNC
augroup end



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
set title

set confirm


set display+=truncate

if !has('gui_running')
  # cursor shape in difference mode
  # &t_SI = "\<esc>[6 q"
  &t_SI = "\<esc>[2 q"
  &t_SR = "\<esc>[4 q"
  &t_EI = "\<esc>[2 q"

  if &term =~ '^\%(alacritty\)'
    &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  if &term == 'xterm-kitty'
    &t_ut = ''
  endif
endif



set laststatus=2

var StatusRef = statusline.StatuslineExpr
&statusline = '%!' .. expand('<SID>') .. 'StatusRef()'
