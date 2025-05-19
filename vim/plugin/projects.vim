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


def FzfCallback(name: string)
  var project = {}
  for i in PROJECTS
    if i.name == name
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


def ShowProjects()
  var items = []
  for i in PROJECTS
    add(items, i.name)
  endfor

  call fzf#run(fzf#wrap({'source': items, 'sink': function('FzfCallback')}))
enddef

command ProjectsShow :vim9cmd ShowProjects()
