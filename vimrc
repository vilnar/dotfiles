filetype plugin indent on
syntax on

set ignorecase smartcase incsearch hlsearch
set laststatus=2 ruler
set mouse=

set showbreak=->
set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$
set wrap

set encoding=utf-8
set fileencoding=utf-8

set history=1000
set wildmenu wildmode=full
set wildignorecase
set shortmess-=S
set showcmd

set autoread
set autowrite

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

set splitbelow
set title

set hidden
set confirm

" fix security
set modelines=0
set nomodeline

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Fix work with docker volumes.
" When writing a file a backup is made.
" This option make a copy of the file and overwirte the original one.
set backupcopy=yes

" colorscheme lightsimple
colorscheme darksimple

nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader="\<Space>"

" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" mark trailing spaces as errors
match ErrorMsg '\s\+$'

" cursor shape in difference mode
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"

