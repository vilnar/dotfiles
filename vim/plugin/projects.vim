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

  feedkeys(':ProjectMy ')
enddef
command ProjectsShow :vim9cmd ShowProjects()


def GoToProject(query: string)
  var project = {}
  for i in PROJECTS
    if i.id == str2nr(query) || i.name == query
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

def ProjectCompletion(arglead: string, cmdline: string, curpos: number): list<string>
  var names: list<string>
  for i in PROJECTS
    add(names, printf("%s", i.name))
  endfor
  return filter(names, 'v:val =~ "^' .. arglead .. '"')
enddef
command -nargs=* -complete=customlist,ProjectCompletion ProjectMy GoToProject(<q-args>)
