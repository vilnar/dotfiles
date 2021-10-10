filetype plugin indent on
syntax on

set ignorecase smartcase incsearch hlsearch
set ruler
set mouse=

set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$
set wrap

set encoding=utf-8
set fileencoding=utf-8

" fix security
set modelines=0
set nomodeline

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Fix work with docker volumes.
" When writing a file a backup is made.
" This option make a copy of the file and overwirte the original one.
set backupcopy=yes

nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader="\<Space>"