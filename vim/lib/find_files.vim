vim9script

def CreateScratchByName(name: string)
  enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  execute 'file ' .. name
enddef

def CreateFilesScratch()
  var name = string(rand(srand(123456789)))
  CreateScratchByName(name)
enddef

# Read from shell and move to new buffer
command -nargs=* -complete=shellcmd FilesBuffer CreateFilesScratch() | read <args>

