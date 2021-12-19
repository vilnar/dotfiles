vim9script

def OpenNewTabWithSelectedText()
  var text = getreg('"')
  execute ':tabnew' 
  execute ':setlocal hidden' 
  execute 'file __TEMP__'
  append(0, split(text, '\n'))
enddef
xnoremap <leader>os y:vim9cmd <SID>OpenNewTabWithSelectedText()<CR>
