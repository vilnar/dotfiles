" OS clipboard yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d


" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" don't use Ex mode, use Q for formatting
nnoremap Q gq
nnoremap <C-LeftMouse> <nop>



nnoremap <Leader>h :nohlsearch<CR>


"Move and indent lines on Ctrl+j and Ctrl+k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" copy line without newline
nnoremap <Leader>l :normal ^vg_"+y<CR>


" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
