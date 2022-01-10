vim9script

if executable('jq')
  command JsonFormatThis execute ":%!jq ."
elseif executable('python3')
  command JsonFormatThis execute ":%!python3 -m json.tool"
endif


if executable('sort')
  command SortThis :%!sort
endif

command HexRead :execute ':%!xxd' | setlocal filetype=xxd
command HexWrite :execute ':%!xxd -r' | setlocal binary | setlocal filetype=xxd

command CtagsGenerateForC :execute 'Start! ctags `find . -name "*.[ch]" -print`'
command CtagsGenerateGo :execute 'Start! ctags `find . -name "*.go" -print && find . -name "*.proto" -print`'
command CtagsGeneratePhp :execute 'Start! ctags `find . -name "*.php" -print`'
