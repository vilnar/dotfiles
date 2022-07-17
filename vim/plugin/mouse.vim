vim9script

set mouse=a
def MouseToggle()
  if &mouse == 'a'
    execute 'set mouse='
    echomsg 'Disable mouse'
  else
    execute 'set mouse=a'
    echomsg 'Enable mouse'
  endif
enddef
