vim9script

command WhiteSpaceTrailSearch /\s\+$

def WhiteSpaceTrailClearInRange(firstline: number, lastline: number)
  execute ":" .. firstline .. "," .. lastline .. "s/\\s\\+$//e"
enddef
command -range WhiteSpaceTrailClear call WhiteSpaceTrailClearInRange(<line1>, <line2>)


augroup WhitespaceMatch
  # Remove ALL autocommands for the WhitespaceMatch group.
  autocmd BufWinEnter * {
    w:whitespace_match_number = matchadd('ExtraWhitespace', '\s\+$')
  }
  autocmd InsertEnter * call ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call ToggleWhitespaceMatch('n')
augroup END

def ToggleWhitespaceMatch(mode: string)
  var pattern = (mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    # Something went wrong, try to be graceful.
    w:whitespace_match_number = matchadd('ExtraWhitespace', pattern)
  endif
enddef


def ToggleWhiteList()
  if &listchars == "tab:> ,space:.,trail:*,precedes:<,extends:>,eol:$"
    set listchars=precedes:<,extends:>
    echomsg 'set simple listchars'
  else
    set listchars=tab:>\ ,space:.,trail:*,precedes:<,extends:>,eol:$
    echomsg 'set extended listchars'
  endif
enddef
