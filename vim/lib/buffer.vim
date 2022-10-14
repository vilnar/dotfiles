vim9script

# The idea is taken here https://vi.stackexchange.com/questions/27104/efficient-way-of-cleaning-up-the-buffer-list
def CloseOtherBuffers()
  var buffer_list = filter(getbufinfo(), (_, v) => v.bufnr != bufnr("%"))
  if !empty(buffer_list)
    var buffer_number = join(mapnew(buffer_list, (_, v) => v.bufnr))
    execute 'bwipeout ' .. buffer_number
    echomsg "delete buffers with number " .. buffer_number
  else
    echomsg "buffer list is empty"
  endif
enddef

command BufferCloseOthers :call <SID>CloseOtherBuffers()
