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
  autocmd ColorScheme gruvbox {
    highlight Ignore ctermbg=NONE ctermfg=245 cterm=NONE guibg=NONE guifg=#928374 gui=NONE
    highlight CurSearch ctermfg=208 ctermbg=235 guifg=#fe8019 guibg=#282828 gui=reverse cterm=reverse
  }
  autocmd ColorScheme darkblue {
    highlight phpIdentifier guifg=#c0c0c0 guibg=NONE gui=NONE cterm=NONE
    highlight link CurSearch IncSearch
    hi MatchParen guifg=#7f7f8c guibg=#bdb76b gui=NONE cterm=NONE
  }
augroup end


# g:gruvbox_invert_selection = 0
# g:gruvbox_italic = 0
# g:gruvbox_underline = 1
# g:gruvbox_contrast_light = "hard"
# g:gruvbox_contrast_dark = "medium"
# g:gruvbox_guisp_fallback = "bg" # fix spell colors
# g:gruvbox_vert_split = "bg1"
# g:gruvbox_hls_highlight = "purple"
# set background=dark
# colorscheme gruvbox


colorscheme darkblue



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

# nnoremap <Leader>w <C-w>w
nnoremap <Leader>w <C-w>p
nnoremap <Leader>1 1<C-w>w
nnoremap <Leader>2 2<C-w>w
nnoremap <Leader>3 3<C-w>w
nnoremap <Leader>4 4<C-w>w
nnoremap <Leader>5 5<C-w>w
nnoremap <Leader>6 6<C-w>w
