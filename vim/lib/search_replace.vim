vim9script

const ESCAPE_CHARS = '\~ \* \$ \[ \] /\ \^ \.'

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
def EscapeForReplace(text: string, replace_text: string, is_whole_word: bool)
  var text_esc = escape(text, ESCAPE_CHARS)
  var replace_text_esc = escape(replace_text, ESCAPE_CHARS)

  # ,$  - start from current position cursor
  var scomm = ":,$s/" .. text_esc .. "/" .. replace_text_esc .. "/gc"
  if is_whole_word
    scomm = ":,$s/\\<" .. text_esc .. "\\>\\C/" .. replace_text_esc .. "/gc"
  endif
  feedkeys(scomm)
enddef


def ReplaceInput(is_whole_word = false)
  var text = input('Query replace: ', '')
  if empty(text)
    echoerr "Query replace is empty"
    return
  endif
  var replace_text = input('Query replace ' .. text .. ' with: ', '')

  call EscapeForReplace(text, replace_text, is_whole_word)
enddef

def ReplaceSelectedInput(is_whole_word = false)
  var text = getreg('"')
  @v = text # copy to register v
  var replace_text = input('Query replace ' .. text .. ' with: ', '')

  call EscapeForReplace(text, replace_text, is_whole_word)
enddef
