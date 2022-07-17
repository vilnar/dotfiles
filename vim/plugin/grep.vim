vim9script

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

def SearchInOpenedBuffers(pattern: string)
  execute 'cclose'
  execute 'cexpr []'
  execute 'bufdo vimgrepadd /' .. pattern .. '/g %'
  execute 'cwindow'
enddef
command -nargs=1 SearchInOpenedBuffers SearchInOpenedBuffers(<f-args>)
