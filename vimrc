filetype plugin indent on
syntax on

set ignorecase smartcase incsearch hlsearch
set ruler
set mouse=

set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$
set linebreak
set wrap

set encoding=utf-8
set fileencoding=utf-8
set scrolloff=5

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
Plug 'tpope/vim-fugitive', { 'tag': 'v3.6' }
Plug 'preservim/nerdtree', { 'tag': '6.10.12' }
Plug 'SirVer/ultisnips', { 'tag': '3.2' }
Plug 'jlanzarotta/bufexplorer', { 'tag': 'v7.4.21' }
Plug 'jparise/vim-graphql', { 'tag': 'v1.4' }
Plug 'arthurxavierx/vim-caser', { 'commit': '6bc9f41d170711c58e0157d882a5fe8c30f34bf6' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'tag': '0.28.0' }
Plug 'junegunn/fzf.vim', { 'commit': 'd6aa21476b2854694e6aa7b0941b8992a906c5ec' }
Plug 'junegunn/goyo.vim', { 'commit': 'a9c7283dce60ffcdec952384f6451ff42f8914f2' }

" async
Plug 'skywind3000/asyncrun.vim', { 'tag': '2.8.6' }
Plug 'tpope/vim-dispatch', {'commit': '3505862b3898be5db3c78ba1b92c703349478d68'}

" format code (command example :FormatLines)
Plug 'google/vim-maktaba', { 'commit': 'f5127b339a9d776f220cc0393783c55def9d8ce0' }
Plug 'google/vim-codefmt', { 'commit': '605dc002cabfec67eded553298aba21ab392ea78' }
Plug 'google/vim-glaive', { 'commit': 'c17bd478c1bc358dddf271a13a4a025efb30514d' }

Plug 'mattn/vim-goimports', { 'commit': '5db0dcf7a11f6b5b89169b2e13aa7a376312cafc' }

Plug 'morhetz/gruvbox', { 'commit': 'bf2885a95efdad7bd5e4794dd0213917770d79b7' }
Plug 'nanotech/jellybeans.vim', { 'commit': 'ef83bf4dc8b3eacffc97bf5c96ab2581b415c9fa' }

call plug#end()
