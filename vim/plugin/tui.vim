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


augroup MyColors
  autocmd ColorScheme default {
    highlight CursorLine    cterm=NONE ctermfg=NONE guifg=NONE
    highlight CursorColumn  cterm=NONE ctermfg=NONE guifg=NONE
  }
  autocmd ColorScheme iceberg {
    if &background == "light"
      highlight Identifier cterm=NONE ctermfg=237 guifg=#33374c
      highlight SpecialKey cterm=NONE ctermfg=248 guifg=#a5b0d3 guibg=#DCDFE7
      highlight NonText cterm=NONE ctermfg=248 guifg=#a5b0d3 guibg=#DCDFE7
    endif
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
augroup end

set background=dark
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

# set background=light
# colorscheme iceberg
if get(g:, 'colors_name', 'default') == "iceberg"
  g:fzf_colors = {'fg': ['fg', 'Normal'],
  'bg':      ['bg', 'Normal'],
  'hl':      ['fg', 'Comment'],
  'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  'hl+':     ['fg', 'Normal'],
  'info':    ['fg', 'PreProc'],
  'border':  ['fg', 'Ignore'],
  'prompt':  ['fg', 'Conditional'],
  'pointer': ['fg', 'Exception'],
  'marker':  ['fg', 'Keyword'],
  'spinner': ['fg', 'Label'],
  'header':  ['fg', 'Comment']}
endif


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
set complete=.,t 
# set complete=. 

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
