function! OpenTerminal()
  let path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " . path
    return
  endif
  execute '!gnome-terminal --working-directory=' . path
endfunction

command! OpenTerminalHere :call OpenTerminal()

noremap <F9> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

