vim9script
# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# set number
# set signcolumn=number
# set numberwidth=6

# set cursorline
# augroup MyCursorLine
#   autocmd VimEnter,WinEnter,BufWinEnter,WinLeave,BufWinLeave * {
#       if &diff
#         set nocursorline
#       else
#         set cursorline
#       endif
#   }
# augroup END

if (has("termguicolors"))
  set termguicolors
endif

augroup MyColors
  autocmd ColorScheme default {
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
  }
  autocmd ColorScheme vividchalk {
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
    highlight phpIdentifier ctermbg=NONE ctermfg=White cterm=NONE guibg=NONE guifg=#EEEEEE gui=NONE
    highlight Ignore        ctermbg=NONE ctermfg=DarkMagenta cterm=NONE guibg=NONE guifg=#9933CC gui=NONE
    highlight Search        cterm=underline gui=underline
    highlight CurSearch     cterm=underline gui=underline guibg=#B6662D
    highlight DiffText      guibg=#AA0000
    highlight Error         guibg=#AA0000
    highlight ErrorMsg      guibg=#AA0000
    highlight SpecialKey    guifg=#494949
    highlight NonText       guifg=#494949
  }
  autocmd ColorScheme gruvbox {
    highlight Ignore ctermbg=NONE ctermfg=245 cterm=NONE guibg=NONE guifg=#928374 gui=NONE
    highlight CurSearch ctermfg=208 ctermbg=235 guifg=#fe8019 guibg=#282828 gui=reverse cterm=reverse
  }
augroup end

# colorscheme vividchalk
if get(g:, 'colors_name', 'default') == "vividchalk"
  g:terminal_ansi_colors = [
    '#000000',
    '#aa0000',
    '#00aa00',
    '#aa5522',
    '#0000ee',
    '#aa00aa',
    '#00aaaa',
    '#aaaaaa',
    '#555555',
    '#ff4444',
    '#44ff44',
    '#ffff00',
    '#5c5cff',
    '#ff00ff',
    '#00ffff',
    '#ffffff'
    ]
endif


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


# set linebreak
set showbreak=->
set nowrap
noremap <F8> :set wrap!<CR>

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

set hidden
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

def g:StatuslineExpr(): string
  var file_path = "%f "
  var modified = "%{&modified ? '[+] ' : ''}"
  var readonly  = "%{&readonly ? '[RO] ' : ''}"
  var separate = " %= "
  var win_nr = "[%{winnr()}] "
  # var fencoding  = "%{&fileencoding ? '['.&fileencoding.'] ' : '['.&encoding.'] '}"
  var ftype  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  var position = " %l:%c "
  var percent = " %P"

  return file_path .. modified .. readonly .. separate .. win_nr  .. ftype .. position .. percent
enddef
set statusline=%!StatuslineExpr()

# nnoremap <Leader>w <C-w>w
nnoremap <Leader>w <C-w>p
nnoremap <Leader>1 1<C-w>w
nnoremap <Leader>2 2<C-w>w
nnoremap <Leader>3 3<C-w>w
nnoremap <Leader>4 4<C-w>w
nnoremap <Leader>5 5<C-w>w
nnoremap <Leader>6 6<C-w>w
