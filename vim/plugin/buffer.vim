vim9script

nnoremap <leader>4 :only<CR>
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
  var curr = bufnr("%")
  var last = bufnr("$")

  if curr > 1
    execute ":1," .. (curr - 1) .. "bd"
  endif
  if curr < last
    execute ":" .. (curr + 1) .. "," .. last .. "bd"
  endif
enddef
command BufferCloseOthers CloseOtherBuffers()
