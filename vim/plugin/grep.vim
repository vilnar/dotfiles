vim9script

# grep in project
nnoremap <Leader>gg :AsyncRun grep -rni --exclude="tags" --exclude-dir=".git" -e '' ./<left><left><left><left>
vnoremap <Leader>gg y:AsyncRun grep -rni --exclude="tags" --exclude-dir=".git" -e '<C-R>"' ./


def GetRelativePathForGrep(): string
  var path = expand('%:h')
  if path == '.'
    return './'
  endif
  var rel_path_match = match(path, "^\./")
  var abs_path_match = match(path, "^\/")
  if rel_path_match != -1 || abs_path_match != -1
    return path
  endif
  return './' .. path .. '/'
enddef

# grep in current directory
nnoremap <expr> <Leader>gd ":AsyncRun grep -rni -e '' " ..  <SID>GetRelativePathForGrep()
vnoremap <expr> <Leader>gd "y:AsyncRun grep -rni -e '<C-R>\"' " ..  <SID>GetRelativePathForGrep()

# grep by filetype
nnoremap <Leader>gi :AsyncRun grep -rni --include \*.go -e '' ./<left><left><left><left>

# grep in current file
nnoremap <Leader>gc :vimgrep //g % \| cw
vnoremap <expr> <Leader>gc "y:vimgrep /<C-R>\"/g % \| cw"


def SearchInOpenedBuffers(pattern: string)
  execute 'cclose'
  execute 'cexpr []'
  # echomsg 'debug SearchInOpenedBuffers : ' .. a:pattern
  execute 'bufdo vimgrepadd /' .. pattern .. '/g %'
  execute 'cwindow'
enddef
command! -nargs=1 SearchInOpenedBuffers SearchInOpenedBuffers(<f-args>)

