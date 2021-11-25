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


call plug#begin()
Plug 'tpope/vim-commentary', { 'tag': 'v1.3' }
Plug 'tpope/vim-surround', { 'tag': 'v2.1' }
Plug 'tpope/vim-fugitive', { 'tag': 'v3.3' }
Plug 'preservim/nerdtree', { 'tag': '6.10.12' }
Plug 'SirVer/ultisnips', { 'tag': '3.2' }
Plug 'jlanzarotta/bufexplorer', { 'tag': 'v7.4.21' }
Plug 'skywind3000/asyncrun.vim', { 'tag': '2.8.6' }
Plug 'jparise/vim-graphql', { 'tag': 'v1.4' }
Plug 'arthurxavierx/vim-caser'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
