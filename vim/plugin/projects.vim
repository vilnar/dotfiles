vim9script

if filereadable(expand("$MYVIMDIR/lib/custom.vim"))
  import "../lib/custom.vim" as custom
endif

var PROJECTS = [
  {id: 1, name: 'Code', dir: '~/Code', execs: []}
]
# echomsg printf("debug %s", custom.PROJECTS)
if exists("custom.PROJECTS")
  PROJECTS = custom.PROJECTS
endif


def ShowProjects()
  echo printf("Project list:\n")
  for i in PROJECTS
    echo printf(" %d %s\n", i.id, i.name)
  endfor

  feedkeys(':P ')
enddef
command ProjectsShow :vim9cmd ShowProjects()


def PCallback(id: string)
  var project = {}
  for i in PROJECTS
    if i.id == str2nr(id)
      project = i
    endif
  endfor
  if empty(project)
    echo "Project not found or not selected"
    return
  endif

  exec ':cd ' .. project.dir
  for cmd in project.execs
    exec cmd
  endfor
  echo "Opened selected project " .. project.name
enddef
command -bang -nargs=* P call PCallback(<q-args>)
