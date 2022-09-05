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
    highlight ExtraWhitespace guibg=#1E0010
  }
  autocmd ColorScheme habamax {
    highlight phpIdentifier guifg=#bcbcbc
  }
augroup end

# colorscheme molokai

colorscheme habamax
highlight ExtraWhitespace guibg=#767676

# g:gruvbox_colors.bright_red = (['#ea6962', 167])
# g:gruvbox_invert_selection = 0
# g:gruvbox_italic = 0
# g:gruvbox_underline = 1
# g:gruvbox_contrast_dark = "medium"
# g:gruvbox_guisp_fallback = "bg" # fix spell colors
# g:gruvbox_vert_split = "bg1"
# g:gruvbox_hls_highlight = "purple"
# colorscheme gruvbox

# set background=dark
# g:gruvbox_material_sign_column_background = "grey"
# colorscheme gruvbox-material
# highlight Function guifg=#FE8019


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
