vim9script

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
