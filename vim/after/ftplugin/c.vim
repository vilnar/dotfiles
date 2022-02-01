command CtagsGenerateForC :execute 'Start! ctags `find . -name "*.[ch]" -print`'
nnoremap <F1> :CtagsGenerateForC<CR>
