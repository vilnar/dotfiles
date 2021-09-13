filetype plugin indent on
syntax on

" One line to copy. Settings to make it easier to find, enable status line and disable mouse
set ignorecase smartcase incsearch hlsearch laststatus=2 ruler mouse=

set showbreak=->
set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$
set nowrap

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


let s:tmp_path = $HOME . "/.vim/tmp"
if !isdirectory(s:tmp_path)
	call mkdir(s:tmp_path, "p")
endif
execute 'set backupdir=' . s:tmp_path
execute 'set directory=' . s:tmp_path

" Fix work with docker volumes.
" When writing a file a backup is made.
" This option make a copy of the file and overwirte the original one.
set backupcopy=yes

" colorscheme lightsimple
colorscheme darksimple

nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader="\<Space>"


" cursor shape in difference mode
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[3 q"
let &t_EI = "\<esc>[2 q"
