vim9script

def OpenNewTabWithSelectedText()
  var text = getreg('"')
  execute ':tabnew' 
  execute ':setlocal hidden' 
  append(0, split(text, '\n'))
enddef
