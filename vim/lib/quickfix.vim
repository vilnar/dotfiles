vim9script

def QuickFixToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen 8
  else
    cclose
  endif
enddef
