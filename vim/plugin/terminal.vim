function! OpenTerminal()
  let path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " . path
    return
  endif
  execute 'Dispatch gnome-terminal --working-directory=' . path
endfunction

command! OpenTerminalHere :call OpenTerminal()
noremap <F9> :call OpenTerminal()<CR>

function! OpenInternalTerminal()
  let path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " . path
    return
  endif
  execute 'terminal'
  execute 'cd ' . path
endfunction
command! OpenInternalTerminalHere :call OpenInternalTerminal()


autocmd VimEnter * call NERDTreeAddKeyMap({
      \ 'key': 'yt',
      \ 'callback': 'NERDTreeOpenTerminal',
      \ 'quickhelpText': 'open terminal in current node' })

function! NERDTreeOpenTerminal()
  let n = g:NERDTreeFileNode.GetSelected()
  if n != {}
    let path = n.path.str()
    if !isdirectory(path)
      echoerr "Not found directory: " . path
      return
    endif
    execute 'Dispatch gnome-terminal --working-directory=' . path
    call nerdtree#echo("Open terminal in " . path)
  endif
endfunction

