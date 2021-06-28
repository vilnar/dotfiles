filetype plugin indent on
" filetype indent off

set showcmd
set ignorecase
set smartcase
set incsearch
set hlsearch
set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$

set showbreak=->
set nowrap

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

set laststatus=2
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

" colorscheme simplelight
colorscheme simpledark

" TODO: test this settings
" open new tab in quick fix list
set switchbuf=newtab


" Installed plugin
" mkdir -p ~/.vim/pack/vendor/start

" help commentary
" git clone https://github.com/tpope/vim-commentary  ~/.vim/pack/vendor/start/vim-commentary

" help surround
" git clone https://github.com/tpope/vim-surround  ~/.vim/pack/vendor/start/vim-surround

" help nerdtree
" git clone https://github.com/preservim/nerdtree  ~/.vim/pack/vendor/start/nerdtree

" git clone https://github.com/tpope/vim-fugitive  ~/.vim/pack/vendor/start/vim-fugitive
" vim -u NONE -c "helptags fugitive/doc" -c q
" help fugitive

" help caser
" git clone https://github.com/arthurxavierx/vim-caser  ~/.vim/pack/vendor/start/vim-caser

" git clone https://github.com/SirVer/ultisnips ~/.vim/pack/vendor/start/ultisnips

" git clone https://github.com/jlanzarotta/bufexplorer ~/.vim/pack/vendor/start/bufexplorer
" vim -u NONE -c "helptags bufexplorer/doc" -c q
" help bufexplorer
