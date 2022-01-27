vim9script

nnoremap <leader>3 :only<CR>
nnoremap <leader>c :close<CR>

noremap <F7> :tabnew<CR>:setlocal hidden<CR>
# tabs switching
# nnoremap <Leader>t :tabs<CR>:tabnext<Space>
# buffers list
# nnoremap <Leader>bl :setlocal nomore <Bar> :ls t <Bar> :setlocal more <CR>:b<Space>
# nnoremap <Leader>b :ls<CR>:b<Space>

# close current buffer
nnoremap <Leader>q :bdelete %<CR>

def CloseOtherBuffers()
  var curr_buff = bufnr("%")
  var last_buff = bufnr("$")

  if curr_buff > 1
    execute ":1," .. (curr_buff - 1) .. "bd"
  endif
  if curr_buff < last_buff
    execute ":" .. (curr_buff + 1) .. "," .. last_buff .. "bd"
  endif
enddef
command BufferCloseOthers CloseOtherBuffers()
