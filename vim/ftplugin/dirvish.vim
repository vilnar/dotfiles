vim9script

def CopyAbsolutePathUnderCursor()
  var path = trim(getline('.'))
  @+ = path
  echo 'Copy absolute path ' .. path
enddef
nnoremap <buffer> ya :vim9cmd <SID>CopyAbsolutePathUnderCursor()<CR>


def CopyRelativePathUnderCursor()
  var path = trim(getline('.'))
  path = fnamemodify(path, ':.')
  @+ = path
  echo 'Copy relative path ' .. path
enddef
nnoremap <buffer> yr :vim9cmd <SID>CopyRelativePathUnderCursor()<CR>


def CopyNameUnderCursor()
  var path = trim(getline('.'))
  path = fnamemodify(path, ':t')
  @+ = path
  echo 'Copy file name ' .. path
enddef
nnoremap <buffer> yn :vim9cmd <SID>CopyNameUnderCursor()<CR>


def g:GetDirectoryPath(): string
    var path = trim(getline('.'))
    if isdirectory(path)
      return path
    endif

    path = fnamemodify(path, ':p:h')
    if isdirectory(path)
      return path
    endif
    echoerr "Not found directory: " .. path
    return ''
enddef

# exists required for fix dirvish error
if !exists('g:OpenTerminalUnderCursor')
  def g:OpenTerminalUnderCursor()
    var path = g:GetDirectoryPath()
    if path == ''
      return
    endif
    execute 'Dispatch gnome-terminal --working-directory=' .. path
    echo 'Open terminal in ' .. path
  enddef
endif
nnoremap <buffer> yt :vim9cmd <SID>OpenTerminalUnderCursor()<CR>

if !exists('g:OpenExplorerUnderCursor')
  def g:OpenExplorerUnderCursor()
    var path = g:GetDirectoryPath()
    if path == ''
      return
    endif
    execute 'Dispatch nautilus ' .. path
    echo 'Open explorer in ' .. path
  enddef
endif
nnoremap <buffer> ye :vim9cmd <SID>OpenExplorerUnderCursor()<CR>

nnoremap - <Plug>(dirvish_up)
