vim9script

set autoread
set autowrite

def CopyPath(path: string)
  @+ = path
  echo "copied to clipboard path: " .. path
enddef
command PathDirCopyAbsolute :vim9cmd CopyPath(expand('%:p:h'))
command PathDirCopyRelative :vim9cmd CopyPath(expand('%:h'))
command PathFileCopyAbsolute :vim9cmd CopyPath(expand('%:p'))
command PathFileCopyRelative :vim9cmd CopyPath(expand('%'))

command FileCopyName :vim9cmd CopyPath(expand('%:t'))
# command FileCopyName :vim9cmd exe "@+ = expand('%:t')"

command EditorShowLineEncoding :echo &fileformat
command EditorShowType :echo &filetype

def RenameFile()
  var old_name = expand('%')
  var new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    execute 'saveas ' .. new_name
    execute 'silent !rm ' .. old_name
    redraw!
  endif
enddef
command FileRename RenameFile()


# Open current file with Encode
nnoremap <Leader>ee :edit ++enc= %<left><left>

# command FileEncodeReopenWithWinCyrilic :e ++enc=cp1251
command EncodeDetectThis :!chardet3 %
command EncodingSupportedShow :help encoding-values
command EncodingShow :echo &fileencoding?&fileencoding:&encoding
command CdToFile :execute 'cd ' .. expand('%:p:h')
