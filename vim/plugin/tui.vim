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
  autocmd ColorScheme gruvbox {
    highlight CurSearch gui=reverse cterm=reverse
    if &background == "dark"
      highlight Ignore ctermbg=NONE ctermfg=245 cterm=NONE guibg=NONE guifg=#928374 gui=NONE
    endif
  }
  autocmd ColorScheme lucius {
    highlight CurSearch gui=reverse cterm=reverse
    if &background == "dark"
      highlight phpIdentifier guifg=#d7d7d7
    else
      highlight phpIdentifier guifg=#444444
    endif
  }
  autocmd ColorScheme zenburn {
    highlight CurSearch gui=reverse cterm=reverse
  }
  autocmd ColorScheme seoul256 {
    highlight phpIdentifier guifg=#d0d0d0
    highlight CurSearch gui=reverse cterm=reverse
  }
  autocmd ColorScheme seoul256-light {
    highlight phpIdentifier guifg=#4e4e4e
    highlight CurSearch gui=reverse cterm=reverse
  }
augroup end


def UseDarkColors(is_set = false)
  set background=dark

  g:gruvbox_invert_selection = 0
  g:gruvbox_italic = 0
  g:gruvbox_underline = 1
  g:gruvbox_contrast_dark = "soft"
  # g:gruvbox_contrast_dark = "medium"
  g:gruvbox_guisp_fallback = "bg" # fix spell colors
  g:gruvbox_vert_split = "bg1"
  g:gruvbox_hls_highlight = "purple"
  g:gruvbox_improved_strings = 1
  colorscheme gruvbox

  # g:lucius_contrast = 'medium'
  # colorscheme lucius

  # g:zenburn_alternate_Visual = 1
  # g:zenburn_high_Contrast = 0
  # g:zenburn_disable_Label_underline = 1
  # colorscheme zenburn

  # g:seoul256_srgb = 1
  # colorscheme seoul256
  # g:terminal_ansi_colors = [
  #   '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
  #   '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
  #   '#626262', '#d75f87', '#87af87', '#ffd787',
  #   '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
  # ]

  # colorscheme default


  if is_set
    call SetTheme("dark")
  endif
enddef


def UseLightColors(is_set = false)
  set background=light

  # g:lucius_contrast = 'medium'
  # colorscheme lucius

  # g:seoul256_srgb = 1
  # colorscheme seoul256-light

  g:gruvbox_invert_selection = 0
  g:gruvbox_italic = 0
  g:gruvbox_underline = 1
  g:gruvbox_contrast_light = "hard"
  g:gruvbox_guisp_fallback = "bg" # fix spell colors
  g:gruvbox_vert_split = "bg1"
  g:gruvbox_hls_highlight = "purple"
  g:gruvbox_improved_strings = 1
  colorscheme gruvbox

  # colorscheme default


  if is_set
    call SetTheme("light")
  endif
enddef


const THEME_PATH = "~/.vim/settings/theme.json"
def SetTheme(value: string)
  var theme = {"theme": value}
  var json = json_encode(theme)
  writefile([json], expand(THEME_PATH))

  const term_command = "kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf"
  const term_theme_conf = "~/.config/kitty/current-theme.conf"
  if value == "dark"
    call system("cp ~/.config/kitty/themes/gruvbox-dark-soft.conf " .. term_theme_conf)
    call system(term_command)
  else
    call system("cp ~/.config/kitty/themes/gruvbox-light-hard.conf " .. term_theme_conf)
    call system(term_command)
  endif
enddef


def GetTheme(): string
  var raw = readfile(expand(THEME_PATH))
  if empty(raw)
    echoerr "File " .. THEME_PATH .. " not found"
    return "dark"
  endif

  var json = json_decode(join(raw))
  if !has_key(json, "theme")
    echoerr "Not found key theme in json"
    return "dark"
  endif
  return json.theme
enddef


def ToggleTheme()
  if GetTheme() == "light"
    call UseDarkColors(true)
  else
    call UseLightColors(true)
  endif
enddef
command ThemeToggle :vim9cmd call ToggleTheme()


if GetTheme() == "dark"
  call UseDarkColors()
else
  call UseLightColors()
endif



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
