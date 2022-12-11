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


def VerboseMap()
  redir! > ~/.vim/log/vim_keys.txt
  silent verbose imap
  # silent verbose map
  redir END
enddef
command VerboseMap :vim9cmd call VerboseMap()
