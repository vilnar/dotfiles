setlocal tabstop=8 softtabstop=4 shiftwidth=4 expandtab commentstring=//\ %s


command CtagsGeneratePhp :execute 'Start! ctags `find . -name "*.php" -print`'
nnoremap <F1> :CtagsGeneratePhp<CR>
