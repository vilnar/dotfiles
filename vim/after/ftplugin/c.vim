command CtagsGenerateForC :execute "Start! fdfind --type f --hidden --exclude .git --no-ignore --glob '*.[ch]' | xargs ctags"
nnoremap <buffer> <F1> :CtagsGenerateForC<CR>
