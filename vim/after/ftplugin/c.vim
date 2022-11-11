command CtagsGenerateForC :execute "Start! find . -name '*.[ch]' | xargs ctags"
nnoremap <F1> :CtagsGenerateForC<CR>
