vim9script

def MouseToggle()
  if &mouse == 'a'
    execute 'set mouse='
    echomsg 'Disable mouse'
  else
    execute 'set mouse=a'
    echomsg 'Enable mouse'
  endif
enddef
