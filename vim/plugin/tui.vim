vim9script

import "../lib/statusline.vim" as statusline

# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# needed for work undo/redo, otherwise history (undo/redo) will not be saved
set hidden

set mouse=a

set number
# set number relativenumber
# set cursorcolumn
# set signcolumn=number
# set numberwidth=6
set cursorline
set cursorlineopt=number

set listchars=tab:\ \ ,precedes:<,extends:>
set list

if (has("termguicolors"))
  set termguicolors
endif

augroup MyColors
  autocmd ColorScheme default {
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    highlight CurSearch gui=reverse cterm=reverse
    highlight ExtraWhitespace guibg=#7E8E91
  }
  autocmd ColorScheme gruvbox {
    highlight ExtraWhitespace guibg=#928374
  }
  autocmd ColorScheme lucius {
    if &background == "dark"
      highlight CurSearch guibg=#87ffff
      highlight Identifier guifg=#d7d7d7
      highlight Function guifg=#d7ffaf
      highlight ExtraWhitespace guibg=#6c6c6c
    else
      highlight CurSearch guibg=#5fd7d7
      highlight Identifier guifg=#444444
      highlight Function guifg=#008700
      highlight ExtraWhitespace guibg=#c2c0c0
    endif
  }
augroup end

g:gruvbox_invert_selection = 0
g:gruvbox_italic = 0
g:gruvbox_underline = 1
g:gruvbox_contrast_light = "hard"
g:gruvbox_contrast_dark = "hard"
g:gruvbox_guisp_fallback = "bg" # fix spell colors
g:gruvbox_vert_split = "bg1"
g:gruvbox_hls_highlight = "purple"
set background=dark
colorscheme gruvbox

# set background=light
# colorscheme lucius

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
