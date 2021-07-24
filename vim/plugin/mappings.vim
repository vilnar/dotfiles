nnoremap <space> <nop>
xnoremap <space> <nop>
let mapleader=" "


" OS clipboard yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P

" disable Ex mode
nnoremap Q <Nop>

" Exact selected multiline string search
vnoremap * "vy/\V<C-R>=substitute(escape(@v,'/\'),'\n','\\n','g')<CR><CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


" Searching for all characters as normal text
command! -nargs=1 SearchEscape :let @/='\V'.escape(<q-args>, '\\')| normal! n
nnoremap <Leader>ss :SearchEscape<space>
" nnoremap <expr> <Leader>su ':SearchEscape ' . expand('<cword>')
vnoremap <Leader>ss y:SearchEscape<space><C-R>"

" replace
nnoremap <Leader>rr :%s###gc<left><left><left><left>
vnoremap <Leader>rr y:%s#<C-R>"##gc<left><left><left>
vnoremap <Leader>rb <Esc>:'<,'>s###gc<left><left><left><left>

vnoremap <Leader>rw y:%s#\<<C-R>"\>\C##gc<left><left><left>
vnoremap <Leader>rv <Esc>:'<,'>s#\<\>\C##gc<left><left><left><left><left><left><left><left>

" grep
nnoremap <Leader>gg :grep! -rni --exclude-dir=".git" -e '' ./<left><left><left><left>
nnoremap <expr> <Leader>gd ":grep! -rni --exclude-dir='.git' -e '' " .  expand('%:h')
nnoremap <expr> <Leader>gc ":grep! -rni --exclude-dir='.git' -e '' " .  expand('%')

vnoremap <Leader>gg y:grep! -rni --exclude-dir=".git" -e '<C-R>"' ./
vnoremap <expr> <Leader>gd "y:grep! -rni --exclude-dir='.git' -e '<C-R>\"' " .  expand('%:h')
vnoremap <expr> <Leader>gc "y:grep! -rni --exclude-dir='.git' -e '<C-R>\"' " .  expand('%')


function! s:createScratchByName(name)
	enew
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
	execute 'file ' . a:name
endfunction

function! s:createFilesScratch()
	let name = '__Files__'
	let bufnumber = bufnr(name)
	if bufnumber == -1
		call s:createScratchByName(name)
	else
		execute 'bdelete ' . name
		call s:createScratchByName(name)
	endif
endfunction

" Read from shell and move to new buffer
command! -nargs=* -complete=shellcmd FilesBuffer call s:createFilesScratch() | r <args>
" command! -nargs=* -complete=shellcmd FilesBuffer enew | setlocal buftype=nofile bufhidden=hide noswapfile | r <args>

" find file
nnoremap <Leader>ff :FilesBuffer !find ./ -not -path "./.git/*" -iname ""<left>
nnoremap <Leader>fu :FilesBuffer !find ./ -not -path "./.git/*" -name "<C-R><C-W>*"<left>
nnoremap <Leader>fp :FilesBuffer !find ./ -not -path "./.git/*" -path "**"<left><left>
vnoremap <Leader>fp y:FilesBuffer !find ./ -not -path "./.git/*" -path "*<C-R>"*"<left><left>
" find and open in quick fix
nnoremap <Leader>fq :cexpr system('find . -iname "" -printf "%p:1:1:%f\n"')<left>

" open quickfix list
nnoremap <Leader>q :copen<CR>

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

" use C-6
" nnoremap <Leader><tab> :b#<CR>

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
