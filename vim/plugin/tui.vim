nnoremap <Leader>1 :setlocal number!<CR>

nnoremap <leader>4 :only<CR>

noremap <F7> :tabnew<CR>:setlocal hidden<CR>
" tabs switching
" nnoremap <Leader>t :tabs<CR>:tabnext<Space>
" buffers list
" nnoremap <Leader>bl :setlocal nomore <Bar> :ls t <Bar> :setlocal more <CR>:b<Space>
" nnoremap <Leader>b :ls<CR>:b<Space>
" close current hidden buffer
nnoremap <Leader>c :bdelete %<CR>
command! BufferCloseOthers :%bd|e#

noremap <F8> :set wrap!<CR>
