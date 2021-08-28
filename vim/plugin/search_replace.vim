" Exact selected multiline string search
vnoremap * "vy/\V<C-R>=substitute(escape(@v, '/\'), '\n', '\\n', 'g')<CR><CR>

" Searching for all characters as normal text
command! -nargs=1 SearchEscape :let @/='\V' . escape(<q-args>, '\\') | normal! n
nnoremap <Leader>ss :SearchEscape<space>
vnoremap <Leader>ss y:SearchEscape<space><C-R>"



" replace
nnoremap <Leader>rr :%s###gc<left><left><left><left>
vnoremap <Leader>rr y:%s#<C-R>"##gc<left><left><left>
vnoremap <Leader>rb <Esc>:'<,'>s###gc<left><left><left><left>

vnoremap <Leader>rw y:%s#\<<C-R>"\>\C##gc<left><left><left>
vnoremap <Leader>rv <Esc>:'<,'>s#\<\>\C##gc<left><left><left><left><left><left><left><left>
