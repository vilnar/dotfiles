vim9script

def CopyPath(path: string)
  @+ = path
  echo "copied to clipboard path: " .. path
enddef
command PathDirCopyAbsolute :vim9cmd CopyPath(expand('%:p:h'))
command PathDirCopyRelative :vim9cmd CopyPath(expand('%:h'))
command PathFileCopyAbsolute :vim9cmd CopyPath(expand('%:p'))
command PathFileCopyRelative :vim9cmd CopyPath(expand('%'))

def CopyPathWithLine(path: string, is_vim_format = false)
  if path == ""
    echoerr "This is temp file, not copy path with line"
    return
  endif
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  var path_with_line = path .. ':' .. line(".")
  if is_vim_format
    path_with_line = "+" .. line(".") .. " " .. path
  endif
  @+ = path_with_line
  echo "copied to clipboard path with line: " .. path_with_line
enddef
command PathFileWithLine :vim9cmd CopyPathWithLine(expand('%'))
command PathFileWithLineVim :vim9cmd CopyPathWithLine(expand('%'), true)

command FileCopyNameAll :vim9cmd CopyPath(expand('%:t'))
command FileCopyName :vim9cmd CopyPath(expand('%:t:r'))
# command FileCopyName :vim9cmd exe "@+ = expand('%:t')"

command EditorShowLineEncoding :echo &fileformat
command EditorShowType :echo &filetype


def RenameFile()
  const wrong_names = ["", ".", ".."]
  var prev_path = expand("%")
  var new_path = input("New file name: ", prev_path, "file")
  if new_path == prev_path || index(wrong_names, new_path) >= 0
    echoerr printf("file %s was not renamed, input is wrong", prev_path)
    return
  endif

  execute "saveas " .. new_path
  if expand('%') == prev_path
    echoerr printf("file %s was not renamed, command saveas canceled", prev_path)
    return
  endif

  if !filereadable(new_path)
    echoerr printf("file %s was not renamed, file %s not saved", prev_path, new_path)
    return
  endif

  execute "bwipeout " .. fnameescape(prev_path)
  delete(prev_path)

  # dect new file type
  execute "edit"
enddef
command FileRename RenameFile()


def RemoveFile()
  var path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  execute "bwipeout " .. expand('%')
  execute "!gio trash " .. shellescape(path)
  if v:shell_error != 0
    echomsg printf("File %s not removed. Shell error %s", path, v:shell_error)
    return
  endif
  echomsg printf("File %s moved to trash!", path)
enddef
command FileRemove RemoveFile()



# command FileEncodeReopenWithWinCyrilic :e ++enc=cp1251
command EncodeDetectThis :!chardet3 %
command EncodingSupportedShow :help encoding-values
command EncodingShow :echo exists(&fileencoding) ? &fileencoding : &encoding
command CdToFile :execute 'cd ' .. expand('%:p:h')
