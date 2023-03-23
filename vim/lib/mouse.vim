vim9script

def MouseToggle()
  if &mouse == 'a'
    set mouse=
    echomsg 'Disable mouse'
  else
    set mouse=a
    echomsg 'Enable mouse'
  endif
enddef
