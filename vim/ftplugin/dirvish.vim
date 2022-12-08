vim9script

def CopyAbsolutePathUnderCursor()
  var yanked = trim(getline('.'))
  @+ = yanked
  echo 'Copy absolute path ' .. yanked
enddef
nnoremap <buffer> ya :vim9cmd <SID>CopyAbsolutePathUnderCursor()<CR>


def CopyRelativePathUnderCursor()
  var path = trim(getline('.'))
  var yanked = fnamemodify(path, ':.')
  @+ = yanked
  echo 'Copy relative path ' .. yanked
enddef
nnoremap <buffer> yr :vim9cmd <SID>CopyRelativePathUnderCursor()<CR>


def CopyNameUnderCursor()
  var path = trim(getline('.'))
  var yanked = fnamemodify(path, ':t')
  @+ = yanked
  echo 'Copy file name ' .. yanked
enddef
nnoremap <buffer> yn :vim9cmd <SID>CopyNameUnderCursor()<CR>


# exists required for fix dirvish error
if !exists('g:OpenTerminalUnderCursor')
  def g:OpenTerminalUnderCursor()
    var path = trim(getline('.'))
    if !isdirectory(path)
      echoerr "Not found directory: " .. path
      return
    endif
    execute 'Dispatch gnome-terminal --working-directory=' .. path
    echo 'Open terminal in ' .. path
  enddef
endif
nnoremap <buffer> yt :vim9cmd <SID>OpenTerminalUnderCursor()<CR>

if !exists('g:OpenExplorerUnderCursor')
  def g:OpenExplorerUnderCursor()
    var path = trim(getline('.'))
    if !isdirectory(path)
      echoerr "Not found directory: " .. path
      return
    endif
    execute 'Dispatch nautilus ' .. path
    echo 'Open explorer in ' .. path
  enddef
endif
nnoremap <buffer> ye :vim9cmd <SID>OpenExplorerUnderCursor()<CR>
