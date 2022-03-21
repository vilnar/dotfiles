vim9script

# search multilines
def EscapeSearchTextMultiLines(text: string, pat: string)
  var text_esc = substitute(escape(text, '/\'), pat, '\\n', 'g')
  var scom = '\V' .. text_esc
  @/ = scom
  histadd('/', scom)
enddef

vnoremap * y:vim9cmd <SID>EscapeSearchTextMultiLines(getreg('"'), '\n')<CR>

command -nargs=1 SearchMultiLine :vim9cmd EscapeSearchTextMultiLines(<q-args>, '\r') | normal! n
nnoremap <Leader>sm :SearchMultiLine<space>


# search
def EscapeSearchText(text: string)
  var text_esc = escape(text, '/\')
  var scom = '\V' .. text_esc
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
  var text_esc = escape(text, '/\')

  # ,$        - start from current position cursor
  # 1,''-&&   - continue from first line from buffer
  var scomm = ':,$s/' .. text_esc .. "//gc | 1,''-&&"
  if is_whole_word
    scomm = ':,$s/\<' .. text_esc .. "\\>\\C//gc | 1,''-&&"
  endif
  feedkeys(scomm)
enddef

nnoremap <Leader>rr :%s///gc<left><left><left><left>
vnoremap <Leader>rr y:vim9cmd <SID>EscapeTextForReplace(false)<CR>
vnoremap <Leader>rb <Esc>:'<,'>s///gc<left><left><left><left>

nnoremap <Leader>ru viwy:vim9cmd <SID>EscapeTextForReplace(true)<CR>
vnoremap <Leader>rw y:vim9cmd <SID>EscapeTextForReplace(true)<CR>

vnoremap <Leader>rv <Esc>:'<,'>s/\<\>\C//gc<left><left><left><left><left><left><left><left>
