vim9script
# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# set number
# set signcolumn=number
# set numberwidth=6

if (has("termguicolors"))
  set termguicolors
endif

augroup MyColors
  autocmd ColorScheme default {
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    highlight CurSearch     ctermfg=white ctermbg=black cterm=NONE gui=NONE
  }
  autocmd ColorScheme gruvbox {
    highlight Ignore ctermbg=NONE ctermfg=245 cterm=NONE guibg=NONE guifg=#928374 gui=NONE
    highlight CurSearch ctermfg=208 ctermbg=235 guifg=#fe8019 guibg=#282828 gui=reverse cterm=reverse
  }
  autocmd ColorScheme lucius {
    highlight CurSearch gui=reverse cterm=reverse
    highlight phpIdentifier guifg=#d7d7d7
  }
  autocmd ColorScheme zenburn {
    highlight CurSearch gui=reverse cterm=reverse
  }
augroup end


def UseDarkColors()
  # g:gruvbox_invert_selection = 0
  # g:gruvbox_italic = 0
  # g:gruvbox_underline = 1
  # g:gruvbox_contrast_dark = "soft"
  # g:gruvbox_guisp_fallback = "bg" # fix spell colors
  # g:gruvbox_vert_split = "bg1"
  # g:gruvbox_hls_highlight = "purple"
  # set background=dark
  # colorscheme gruvbox

  # set background=dark
  # g:lucius_contrast = 'medium'
  # colorscheme lucius

  g:zenburn_alternate_Visual = 1
  g:zenburn_high_Contrast = 1
  colorscheme zenburn
enddef

def UseLightColors()
  set background=light
  g:lucius_contrast = 'medium'
  colorscheme lucius
enddef


call UseDarkColors()
# call UseLightColors()


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
endif



set laststatus=2

def GetIndtentation(): string
  var mess = "T:" # tabs
  if &expandtab == true
    mess = "S:" # spaces
  endif
  return mess .. shiftwidth()
enddef

def g:StatuslineExpr(): string
  var file_path = "%f "
  var modified = "%{&modified ? '[+] ' : ''}"
  var readonly  = "%{&readonly ? '[RO] ' : ''}"
  var separate = " %= "
  var win_nr = "[%{winnr()}] "
  # var fencoding  = "%{&fileencoding ? '['.&fileencoding.'] ' : '['.&encoding.'] '}"
  var ftype  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  var indentaition = GetIndtentation() .. " "
  var position = " %l:%c "
  var percent = " %P"

  return file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent
enddef
set statusline=%!StatuslineExpr()
