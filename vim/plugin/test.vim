vim9script

def ToggleVerbose()
  if !&verbose
    set verbosefile=~/.vim/log/verbose.log
    set verbose=25
  else
    set verbose=0
    set verbosefile=
  endif
enddef
command VerboseToggle :vim9cmd call ToggleVerbose()
