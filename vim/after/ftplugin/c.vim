command CtagsGenerateForC :execute "Start! fdfind --type f --hidden --exclude .git --no-ignore --glob '*.[ch]' | xargs ctags"
nnoremap <F1> :CtagsGenerateForC<CR>
