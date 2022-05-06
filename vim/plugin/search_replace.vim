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

vnoremap * y:vim9cmd <SID>EscapeSearchTextMultiLines(getreg('"'), '\n')<CR>

command -nargs=1 SearchMultiLine :vim9cmd EscapeSearchTextMultiLines(<q-args>, '\r') | normal! n
nnoremap <Leader>sm :SearchMultiLine<space>


# search
def EscapeSearchText(text: string)
  var text_esc = escape(text, ESCAPE_CHARS)
  # var scom = '\V' .. text_esc
  var scom = text_esc
  @/ = scom
  histadd('/', scom)
enddef

command -nargs=1 SearchEscape :vim9cmd EscapeSearchText(<q-args>) | normal! n
nnoremap <Leader>se :SearchEscape<space>
vnoremap <Leader>se y:vim9cmd <SID>EscapeSearchText(getreg('"'))<CR>

vnoremap <Leader>ss y/<C-R>"


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

nnoremap <Leader>rr :%s///gc<left><left><left><left>
vnoremap <Leader>rr y:vim9cmd <SID>EscapeTextForReplace(false)<CR>
vnoremap <Leader>rb <Esc>:'<,'>s///gc<left><left><left><left>

nnoremap <Leader>ru viwy:vim9cmd <SID>EscapeTextForReplace(true)<CR>
vnoremap <Leader>rw y:vim9cmd <SID>EscapeTextForReplace(true)<CR>

vnoremap <Leader>rv <Esc>:'<,'>s/\<\>\C//gc<left><left><left><left><left><left><left><left>
