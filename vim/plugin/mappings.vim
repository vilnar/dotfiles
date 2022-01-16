vim9script

# OS clipboard yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d


# Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

# don't use Ex mode, use Q for formatting
nnoremap Q gq
nnoremap <C-LeftMouse> <nop>



nnoremap <Leader>h :nohlsearch<CR>


# Move and indent lines on Ctrl+j and Ctrl+k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


# Jump to next split
nnoremap <Leader>w <C-w>w


# copy line without newline
nnoremap <Leader>l :normal ^vg_"+y<CR>

# highlight
def RunSearchUnderCursor()
  var scom = '\<' .. expand('<cword>') .. '\>'
  @/ = scom
  execute "histadd('/', '" .. scom .. "')"
enddef
nnoremap <silent> <Leader>8 :vim9cmd <SID>RunSearchUnderCursor()<BAR>set hls<CR>
