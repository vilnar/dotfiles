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
  }
  autocmd ColorScheme unokai {
    hi! link markdownCode String
  }
augroup end


if (v:versionlong > 9011243)
  set diffopt+=inline:char
endif
# colorscheme retrobox
colorscheme unokai

def RunBackgroundToggle()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
enddef
command BackgroundToggleLightDark RunBackgroundToggle()



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

