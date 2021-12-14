if executable('jq')
  command! JsonFormatThis :%!jq .
endif

if executable('sort')
  command! SortThis :%!sort
endif

command! SnippetsOpen :execute 'edit ~/.vim/UltiSnips/'
command! SnippetsCustomOpen :execute 'edit ~/.vim/customsnippets/'

command! HexRead :execute '%!xxd' | setlocal filetype=xxd
command! HexWrite :execute '%!xxd -r' | setlocal binary | setlocal filetype=xxd

command! CtagsGenerateForC :execute 'Dispatch ctags `find . -name "*.[ch]" -print`'
command! CtagsGenerateGo :execute 'Dispatch ctags `find . -name "*.go" -print && find . -name "*.proto" -print`'
command! CtagsGeneratePhp :execute 'Dispatch ctags `find . -name "*.php" -print`'

command! GoVimRuntime exec ':cd ' . $VIMRUNTIME
command! ColorTest exec ':e ' . $VIMRUNTIME . '/syntax/colortest.vim'
