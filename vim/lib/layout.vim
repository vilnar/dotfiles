vim9script

def OpenNewTabWithSelectedText()
  var text = getreg('"')
  execute ':tabnew'
  append(0, split(text, '\n'))
enddef
