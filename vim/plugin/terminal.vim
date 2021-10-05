function! OpenTerminal()
  let dir_current = expand('%:p:h')
  echomsg "debug " . dir_current
  if !isdirectory(dir_current)
    echoerr "Not found directory: " . dir_current
    return
  endif
  execute '!gnome-terminal ' . dir_current
endfunction

command! OpenTerminalHere :call OpenTerminal()<CR>

noremap <F9> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

