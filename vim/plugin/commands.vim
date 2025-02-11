vim9script

if executable('jq')
  command JsonFormatThis execute ":%!jq ."
  command JsonMinifyThis execute ":%!jq -c ."
elseif executable('python3')
  command JsonFormatThis execute ":%!python3 -m json.tool"
endif


if executable('sort')
  command SortThis :%!sort
endif
command SortUniqThis :sort u

command HexRead :execute ':%!xxd' | setlocal filetype=xxd
command HexWrite :execute ':%!xxd -r' | setlocal binary | setlocal filetype=xxd
command Version :enew | put = execute('version')
command MarksList :enew | put = execute('marks')
command ColorTest :help group-name
command ScriptNames :enew | put = execute('scriptnames')
command Messages :enew | put = execute('messages')


def RunFeeMode()
  set guifont=Courier\ New:h14
  Goyo
enddef
command FreeMode RunFeeMode()

# type fix
command Vs :vs
command Wq :wq
command EX :Ex
