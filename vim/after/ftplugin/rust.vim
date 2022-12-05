command CtagsGenerateForRust :execute 'Start! ctags `find . -name "*.rs" -print`'
nnoremap <buffer> <F1> :CtagsGenerateForRust<CR>
