vim9script 

def RunFileHistory()
  var path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  execute 'G log -- %'
enddef
command FileHistory RunFileHistory()

command GitLog :execute "G log -n 1000"
