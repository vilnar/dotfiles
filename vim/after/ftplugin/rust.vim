command CtagsGenerateForRust :execute 'Start! ctags `find . -name "*.rs" -print`'
nnoremap <F1> :CtagsGenerateForRust<CR>
