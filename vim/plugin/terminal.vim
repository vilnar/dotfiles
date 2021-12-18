vim9script

def OpenTerminal()
  var path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " .. path
    return
  endif
  execute 'Start! gnome-terminal --working-directory=' .. path
enddef

command OpenTerminalHere OpenTerminal()
noremap <F9> :vim9cmd <SID>OpenTerminal()<CR>

def OpenInternalTerminal()
  var path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " .. path
    return
  endif
  execute 'terminal'
  execute 'cd ' .. path
enddef
command OpenInternalTerminalHere OpenInternalTerminal()
