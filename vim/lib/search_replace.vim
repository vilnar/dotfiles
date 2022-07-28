vim9script

const ESCAPE_CHARS = '\~ \* \$ \[ \] /\'

# search multilines
def EscapeSearchTextMultiLines(text: string, pat: string)
  var text_esc = substitute(escape(text, ESCAPE_CHARS), pat, '\\n', 'g')
  # var scom = '\V' .. text_esc
  var scom = text_esc
  @/ = scom
  histadd('/', scom)
enddef

command -nargs=1 SearchMultiLine :vim9cmd EscapeSearchTextMultiLines(<q-args>, '\r') | normal! n

# search
def EscapeSearchText(text: string)
  var text_esc = escape(text, ESCAPE_CHARS)
  # var scom = '\V' .. text_esc
  var scom = text_esc
  @/ = scom
  histadd('/', scom)
enddef

command -nargs=1 SearchEscape :vim9cmd EscapeSearchText(<q-args>) | normal! n

# replace
def EscapeTextForReplace(is_whole_word: bool)
  var text = getreg('"')
  var text_esc = escape(text, ESCAPE_CHARS)

  # ,$  - start from current position cursor
  var scomm = ":,$s/" .. text_esc .. "//gc"
  if is_whole_word
    scomm = ":,$s/\<" .. text_esc .. "\\>\\C//gc"
  endif
  feedkeys(scomm)
enddef
