function! FileHistory()
  let path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " . path
    return
  endif
  execute 'Dispatch gitk ' . path
endfunction

command! FileHistory :call FileHistory()


function! BlameFile()
  let path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " . path
    return
  endif
  execute 'Dispatch git gui blame ' . path
endfunction

command! BlameFile :call BlameFile()
