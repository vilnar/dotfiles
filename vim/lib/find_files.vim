vim9script

def CreateScratch()
  enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
enddef

# Read from shell and move to new buffer
command -nargs=* -complete=shellcmd FilesBuffer CreateScratch() | read <args>

