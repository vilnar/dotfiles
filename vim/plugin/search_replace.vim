vim9script

# Exact selected multiline string search
vnoremap * "vy/\V<C-R>=substitute(escape(@v, '/\'), '\n', '\\n', 'g')<CR><CR>

command! -nargs=1 SearchMultiLine :let @/='\V' . substitute(escape(<q-args>, '/\'), '\r', '\\n', 'g') | normal! n
nnoremap <Leader>sm :SearchMultiLine<space>

# Searching for all characters as normal text
command! -nargs=1 SearchEscape :let @/='\V' . escape(<q-args>, '\\') | normal! n
nnoremap <Leader>se :SearchEscape<space>
vnoremap <Leader>se y:SearchEscape<space><C-R>"

vnoremap <Leader>ss y/<C-R>"

# replace
# TODO: add func for auto escape text
nnoremap <Leader>rr :%s###gc<left><left><left><left>
vnoremap <Leader>rr y:%s#<C-R>"##gc<left><left><left>
vnoremap <Leader>rb <Esc>:'<,'>s###gc<left><left><left><left>

vnoremap <Leader>rw y:%s#\<<C-R>"\>\C##gc<left><left><left>
vnoremap <Leader>rv <Esc>:'<,'>s#\<\>\C##gc<left><left><left><left><left><left><left><left>
