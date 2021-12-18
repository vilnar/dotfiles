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
command -nargs=* -complete=shellcmd FilesBuffer CreateFilesScratch() | r <args>

# find file
# nnoremap <Leader>ff :FilesBuffer !find * -not -path "./.git/*" -iname ""<left>
# nnoremap <Leader>fu :FilesBuffer !find * -not -path "./.git/*" -name "<C-R><C-W>*"<left>
nnoremap <Leader>fp :vim9cmd FilesBuffer !find * -not -path "./.git/*" -iname "**"<left><left>
vnoremap <Leader>fp y:vim9cmd FilesBuffer !find * -not -path "./.git/*" -path "*<C-R>"*"<left><left>
