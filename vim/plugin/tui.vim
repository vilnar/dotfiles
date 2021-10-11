" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" set number
set signcolumn=number
" set numberwidth=6
set cursorline
nnoremap <Leader>1 :setlocal number!<CR>


" colorscheme lightsimple
" colorscheme darksimple
colorscheme jellybeans

set showbreak=->
set nowrap
noremap <F8> :set wrap!<CR>

set history=1000
set wildmenu wildmode=full
set wildignorecase
set shortmess-=S
set showcmd

set splitbelow
set title

set hidden
set confirm

set nomore

" cursor shape in difference mode
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"

set laststatus=2
function! s:statusline_expr()
  let modified = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let ftype  = "%{len(&filetype) ? '  ' . &filetype . ' ' : ' '}"
  let fencoding  = "%{&fileencoding ? '[' . &fileencoding . '] ' : '[' . &encoding . '] '}"
  " let pos = ' %-12(%l:%c%V%) '
  let pos = ' %l:%c '
  let pct = ' %P'

  return '%F %<' . modified . ro . sep . fug . ftype . fencoding . pos . '%*' . pct
endfunction
let &statusline = s:statusline_expr()
