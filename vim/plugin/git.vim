vim9script 

def RunFileHistory()
  var path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  execute 'Start! git-dag ' .. path
enddef
command FileHistory RunFileHistory()


def RunBlameFile()
  var path = expand('%:p')
  if !filereadable(path)
    echoerr "Not found file: " .. path
    return
  endif
  execute 'Start! git gui blame ' .. path
enddef
command BlameFile RunBlameFile()


def RunGitHistory()
  var path = getcwd()
  if !isdirectory(path)
    echoerr "Not found directory: " .. path
    return
  endif
  execute 'Start! git-dag ' .. path
enddef
command GitHistory RunGitHistory()

command GitLog :execute "G log -n 1000"
