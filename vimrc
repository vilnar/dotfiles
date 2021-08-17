filetype plugin indent on
syntax on

set showcmd
set ignorecase
set smartcase
set incsearch
set hlsearch
set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$

set showbreak=->
set nowrap
set laststatus=2
set ruler

set mouse=
set confirm

set history=1000
set wildmenu wildmode=full
set wildignorecase
set shortmess-=S

set autoread
set autowrite

set tabstop=8 softtabstop=8 shiftwidth=8
set backspace=indent,eol,start

set splitbelow

set title
set hidden

" fix security
set modelines=0
set nomodeline


let s:tmp_path = $HOME . "/.vim/tmp"
if !isdirectory(s:tmp_path)
	call mkdir(s:tmp_path, "p")
endif
execute 'set backupdir=' . s:tmp_path
execute 'set directory=' . s:tmp_path

" colorscheme lightsimple
colorscheme darksimple
