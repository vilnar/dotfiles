vim9script

import "./custom.vim" as custom

var PROJECTS = [
  {id: 1, name: 'Code', dir: '~/Code', exec: ''}
]
if exists("custom.PROJECTS")
  PROJECTS = custom.PROJECTS
endif


def MenuCB(id: number, result: number)
  var project = {}
  for i in PROJECTS
    if i.id == result
      project = i
    endif
  endfor
  if empty(project)
    echo "Project not found or not selected"
    return
  endif

  exec ':cd ' .. project.dir
  echo "Opened selected project " .. project.name
enddef


def ShowProjects()
  var items = []
  for i in PROJECTS
    add(items, i.name)
  endfor

  call popup_menu(
    items,
    {
      title: " Project menu ",
      callback: 'MenuCB',
      line: 25, col: 60,
      highlight: 'Question',
      border: [],
      close: 'click',
      padding: [1, 1, 0, 1]
    }
  )
enddef

command ProjectsShow :vim9cmd ShowProjects()
