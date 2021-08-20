nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader=" "


" OS clipboard yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d


" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" disable Ex mode
nnoremap Q <Nop>


" quickfix toggle
function! ToggleQuickFix()
	if empty(filter(getwininfo(), 'v:val.quickfix'))
		copen 8
	else
		cclose
	endif
endfunction

nnoremap <silent> <leader>3 :call ToggleQuickFix()<CR>

nnoremap <Leader>1 :setlocal number!<CR>

function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
	else
		set mouse=a
	endif
endfunction
nnoremap <Leader>2 :call ToggleMouse()<CR>


nnoremap <Leader>h :noh<CR>

"Move and indent lines on Ctrl+j and Ctrl+k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" copy line without newline
nnoremap <Leader>l :normal ^vg_"+y<CR>

" tabs switching
nnoremap <Leader>t :tabs<CR>:tabnext<Space>

" buffers list
nnoremap <Leader>bl :setlocal nomore <Bar> :ls t <Bar> :setlocal more <CR>:b<Space>


" close current hidden buffer
nnoremap <Leader>c :bdelete %<CR>

" Open current file with Encode
nnoremap <Leader>ee :edit ++enc= %<left><left>


" show whitespace
noremap <F6> :set list!<CR>
inoremap <F6> :set list!<CR>
cnoremap <F6> :set list!<CR>

noremap <F7> :tabnew<CR>:setlocal hidden<CR>
noremap <F8> :set wrap!<CR>
noremap <F9> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" clear whitespace in block
vnoremap <F10> <Esc>:'<,'>s/\s\+$//e<CR>

" ctrl+^ for change keymap in INSERT mode
set keymap=ukrainian-enhanced
set iminsert=0 " Default - latin layout
set imsearch=0 " Default - latin layout in sea
inoremap <C-\> <C-^>

" find in tags:
nnoremap <leader>t :TS <c-r>=expand("<cword>")<cr><CR>
