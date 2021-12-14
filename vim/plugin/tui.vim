" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" set number
set signcolumn=number
" set numberwidth=6
set cursorline
nnoremap <Leader>1 :setlocal number!<CR>



" colorscheme lightsimple
" colorscheme darksimple

let g:gruvbox_contrast_dark = 'medium' 
let g:gruvbox_invert_selection = 0
set background=dark
colorscheme gruvbox

set showbreak=->
set nowrap
noremap <F8> :set wrap!<CR>

set history=1000
set wildmenu wildmode=full
set wildignorecase
set shortmess-=S
set showcmd
" set complete=.,b,u,t 
set complete=.,t 

set splitbelow
set title

set hidden
set confirm

set nomore

set display+=lastline

" cursor shape in difference mode
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"

set laststatus=2
