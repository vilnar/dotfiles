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
