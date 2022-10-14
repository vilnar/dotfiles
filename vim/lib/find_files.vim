vim9script

def CreateScratchByName(name: string)
  enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  execute 'file ' .. name
enddef

def CreateFilesScratch()
  var name = '__Files__'
  var bufnumber = bufnr(name)
  if bufnumber == -1
    CreateScratchByName(name)
  else
    execute 'bdelete ' .. name
    CreateScratchByName(name)
  endif
enddef

# Read from shell and move to new buffer
command -nargs=* -complete=shellcmd FilesBuffer CreateFilesScratch() | read <args>

