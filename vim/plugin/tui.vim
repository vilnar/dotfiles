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
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    highlight CurSearch gui=reverse cterm=reverse
    highlight ExtraWhitespace guibg=#7E8E91
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
  autocmd ColorScheme badwolf {
    highlight phpIdentifier guifg=#f8f6f2
    highlight CurSearch guifg=#1c1b1a guibg=#ffa724
    highlight CursorColumn guifg=NONE guibg=#3E3D32
    highlight ExtraWhitespace guibg=#857f78

    highlight DbgBreakptLine guifg=#ffffff guibg=#7aae29
    highlight DbgBreakptSign guifg=#ffffff guibg=#7aae29
    highlight DbgCurrentLine guifg=#ffffff guibg=#f5669c
    highlight DbgCurrentSign guifg=#ffffff guibg=#f5669c
    highlight DbgDisabledSign guifg=#ffffff guibg=#42a7cf
    highlight DbgDisabledLine guifg=#ffffff guibg=#42a7cf
    highlight DbgCurrentStackPositionSign guifg=#ffffff guibg=#42a7cf
    highlight DbgCurrentStackPositionLine guifg=#ffffff guibg=#42a7cf

    hi SpellBad guifg=#e8e8d3 guibg=#902020 guisp=#ff0000 gui=underline cterm=underline
    hi SpellCap guifg=#e8e8d3 guibg=#0000df guisp=#0000ff gui=underline cterm=underline
    hi SpellLocal guifg=#e8e8d3 guibg=#2d7067 guisp=#00ffff gui=underline cterm=underline
    hi SpellRare guifg=#e8e8d3 guibg=#540063 guisp=#ff00ff gui=underline cterm=underline
  }
  autocmd ColorScheme goodwolf {
    highlight ExtraWhitespace guibg=#857f78
  }
augroup end

colorscheme jellybeans_optimized
# colorscheme parchment_optimized
# colorscheme badwolf
# colorscheme goodwolf
# colorscheme molokai

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
