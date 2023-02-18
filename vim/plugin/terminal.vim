vim9script

def OpenTerminal()
  var path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " .. path
    return
  endif
  execute 'Start! gnome-terminal --working-directory=' .. path
  # execute 'Start! alacritty --working-directory ' .. path
  # execute 'Start! xterm -e "cd ' .. path .. ' && bash"'
enddef

command TerminalOpenHere OpenTerminal()

def OpenInternalTerminal()
  var path = expand('%:p:h')
  if !isdirectory(path)
    echoerr "Not found directory: " .. path
    return
  endif
  execute 'terminal'
  execute 'cd ' .. path
enddef
command TerminalInternalOpenHere OpenInternalTerminal()


def OpenFileInNewTerminal()
  var path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  execute 'Start! gnome-terminal -- vim ' .. path
  # execute 'Start! alacritty --command vim ' .. path
  # execute 'Start! xterm -e "vim ' .. path .. '"'
enddef
command TerminalOpenFileInNew OpenFileInNewTerminal()
