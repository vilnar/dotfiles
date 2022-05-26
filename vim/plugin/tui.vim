vim9script
# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# set number
# set signcolumn=number
# set numberwidth=6
# set cursorline
# set cursorlineopt=number

if (has("termguicolors"))
  set termguicolors
endif

set cursorline
augroup MyCursorLine
  autocmd VimEnter,WinEnter,BufWinEnter,WinLeave,BufWinLeave * {
      if &diff
        set nocursorline
      else
        set cursorline
      endif
  }
augroup END

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
  autocmd ColorScheme zenburn {
    highlight Search cterm=underline gui=underline
    highlight CurSearch guifg=#f8f893 guibg=#385f38 ctermfg=228 ctermbg=23 cterm=underline gui=underline
  }
augroup end

# set background=dark
colorscheme vividchalk
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


# g:zenburn_high_Contrast = 0
# g:zenburn_italic_Comment = 0
# g:zenburn_color_also_Ignore = 1
# g:zenburn_alternate_Visual = 1
# g:zenburn_alternate_Error = 0
# g:zenburn_disable_Label_underline = 1
# g:zenburn_unified_CursorColumn = 1
# colorscheme zenburn


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
