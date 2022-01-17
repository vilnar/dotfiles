vim9script

# search multilines
def EscapeSearchTextMultiLines(text: string, pat: string)
  var textEsc = substitute(escape(text, '/\'), pat, '\\n', 'g')
  var scom = '\V' .. textEsc
  @/ = scom
  histadd('/', scom)
enddef
vnoremap * y:vim9cmd <SID>EscapeSearchTextMultiLines(getreg('"'), '\n')<CR>

command -nargs=1 SearchMultiLine :vim9cmd EscapeSearchTextMultiLines(<q-args>, '\r') | normal! n
nnoremap <Leader>sm :SearchMultiLine<space>


# search
def EscapeSearchText(text: string)
  var textEsc = escape(text, '/\')
  var scom = '\V' .. textEsc
  @/ = scom
  histadd('/', scom)
enddef
command -nargs=1 SearchEscape :vim9cmd EscapeSearchText(<q-args>) | normal! n
nnoremap <Leader>se :SearchEscape<space>
vnoremap <Leader>se y:vim9cmd <SID>EscapeSearchText(getreg('"'))<CR>

vnoremap <Leader>ss y/<C-R>"


# replace
def EscapeTextForReplace(isWholeWord: bool)
  var text = getreg('"')
  var textEsc = escape(text, '/\')

  var scomm = ':%s/' .. textEsc .. '//gc'
  if isWholeWord
    scomm = ':%s/\<' .. textEsc .. '\>\C//gc'
  endif
  feedkeys(scomm)
enddef
nnoremap <Leader>rr :%s///gc<left><left><left><left>
vnoremap <Leader>rr y:vim9cmd <SID>EscapeTextForReplace(false)<CR>
vnoremap <Leader>rb <Esc>:'<,'>s///gc<left><left><left><left>

vnoremap <Leader>rw y:vim9cmd <SID>EscapeTextForReplace(true)<CR>
vnoremap <Leader>rv <Esc>:'<,'>s/\<\>\C//gc<left><left><left><left><left><left><left><left>
