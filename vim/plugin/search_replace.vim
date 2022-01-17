vim9script

def EscapeSearchTextMultiLines(text: string, pat: string)
  var textEsc = substitute(escape(text, '/\'), pat, '\\n', 'g')
  var scom = '\V' .. textEsc
  @/ = scom
  execute "histadd('/', '" .. scom .. "')"
enddef
# Exact selected multiline string search
vnoremap * y:vim9cmd <SID>EscapeSearchTextMultiLines(getreg('"'), '\n')<CR>

command -nargs=1 SearchMultiLine :vim9cmd EscapeSearchTextMultiLines(<q-args>, '\r') | normal! n
nnoremap <Leader>sm :SearchMultiLine<space>



def EscapeSearchText(text: string)
  var textEsc = escape(text, '\\')
  var scom = '\V' .. textEsc
  @/ = scom
  execute "histadd('/', '" .. scom .. "')"
enddef
command -nargs=1 SearchEscape :vim9cmd EscapeSearchText(<q-args>) | normal! n
nnoremap <Leader>se :SearchEscape<space>
vnoremap <Leader>se y:vim9cmd <SID>EscapeSearchText(getreg('"'))<CR>

vnoremap <Leader>ss y/<C-R>"

# replace
# TODO: add func for auto escape text
nnoremap <Leader>rr :%s///gc<left><left><left><left>
vnoremap <Leader>rr y:%s/<C-R>"//gc<left><left><left>
vnoremap <Leader>rb <Esc>:'<,'>s///gc<left><left><left><left>

vnoremap <Leader>rw y:%s/\<<C-R>"\>\C//gc<left><left><left>
vnoremap <Leader>rv <Esc>:'<,'>s/\<\>\C//gc<left><left><left><left><left><left><left><left>

# this not working!
# def EscapeTextForReplace(): string
#   execute 'normal gvy'
#   var text = getreg('"')
#   var textEsc = escape(text, '\\')
#   return '%s/' .. textEsc .. '//gc' 
# enddef
# vnoremap <expr> <Leader>rr "<esc>:" .. <SID>EscapeTextForReplace()
