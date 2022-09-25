vim9script

import "../lib/statusline.vim" as statusline

# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden

set mouse=a

set number
# set cursorcolumn
# set signcolumn=number
# set numberwidth=6
set cursorline
set cursorlineopt=number


if (has("termguicolors"))
  set termguicolors
endif

augroup MyColors
  autocmd ColorScheme default {
    # highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    # highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    highlight CurSearch gui=reverse cterm=reverse
  }
  autocmd ColorScheme molokai {
    highlight CurSearch gui=reverse cterm=reverse
    highlight phpIdentifier guifg=#F8F8F2
    highlight Error guibg=#F92672

    highlight ExtraWhitespace guibg=#7E8E91

    highlight DbgBreakptLine guifg=#ffffff guibg=#7aae29
    highlight DbgBreakptSign guifg=#ffffff guibg=#7aae29
    highlight DbgCurrentLine guifg=#ffffff guibg=#f5669c
    highlight DbgCurrentSign guifg=#ffffff guibg=#f5669c
    highlight DbgDisabledSign guifg=#ffffff guibg=#42a7cf
    highlight DbgDisabledLine guifg=#ffffff guibg=#42a7cf
    highlight DbgCurrentStackPositionSign guifg=#ffffff guibg=#42a7cf
    highlight DbgCurrentStackPositionLine guifg=#ffffff guibg=#42a7cf
  }
  autocmd ColorScheme jellybeans {
    highlight Special         guifg=#CC8BC9
    highlight NonText         guifg=#465457
    highlight SpecialKey      guifg=#465457
    highlight ExtraWhitespace guibg=#888888
  }
augroup end

set background=dark
# colorscheme molokai
g:jellybeans_overrides = {
  'background': { 'guibg': '1E1E1E' },
}
g:jellybeans_use_term_italics = 0
g:jellybeans_use_gui_italics = 0
colorscheme jellybeans

# fix internal terminal colors scheme - jellybeans
g:terminal_ansi_colors = repeat([0], 16)
# Black
g:terminal_ansi_colors[0] = "#414141"
g:terminal_ansi_colors[8] = "#BDBDBD"
# Red
g:terminal_ansi_colors[1] = "#E87174"
g:terminal_ansi_colors[9] = "#FFA0A2"
# Green
g:terminal_ansi_colors[2] = "#93B97E"
g:terminal_ansi_colors[10] = "#B8BB26"
# Yellow
g:terminal_ansi_colors[3] = "#FFB981"
g:terminal_ansi_colors[11] = "#FFDBA5"
# Blue
g:terminal_ansi_colors[4] = "#648699"
g:terminal_ansi_colors[12] = "#ABD9F3"
# Magenta
g:terminal_ansi_colors[5] = "#E1C0F6"
g:terminal_ansi_colors[13] = "#FBDAFC"
# Cyan
g:terminal_ansi_colors[6] = "#00988E"
g:terminal_ansi_colors[14] = "#00B3A8"
# White
g:terminal_ansi_colors[7] = "#DEDEDE"
g:terminal_ansi_colors[15] = "#FEFEFE"

# set linebreak
set showbreak=->
set nowrap

set history=1000
set wildmenu wildmode=full
set wildignorecase
set wildoptions=pum pumheight=20
set shortmess-=S
set showcmd
# set complete=.,b,u,t
# set complete=.,t
set complete=.

set splitbelow
set title

set confirm

set nomore

set display+=lastline

if !has('gui_running')
  # cursor shape in difference mode
  &t_SI = "\<esc>[6 q"
  &t_SR = "\<esc>[3 q"
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
