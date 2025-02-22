vim9script

augroup AutoSettingsFileType
  autocmd BufRead,BufNewFile .gitignore,.env.local,.env,.env.example,.env.test,*.conf {
    setlocal filetype=conf
  }
  autocmd BufRead,BufNewFile www.conf {
    setlocal filetype=dosini
  }
augroup END

augroup DiffOption
  autocmd OptionSet diff {
    if &diff
      setlocal syntax=OFF
      setlocal list
    else
      setlocal syntax=ON
      setlocal list!
    endif
  }
  # vimdiff
  autocmd VimEnter * {
    if &diff
      getwininfo()->map((_, v) => win_execute(v.winid, 'setlocal syntax=OFF list'))
    endif
  }
augroup END


# augroup FugitiveCustom
#   autocmd FileType fugitive setlocal bufhidden=
#   autocmd FileType git {
#     setlocal foldmethod=syntax
#     setlocal bufhidden=
#     setlocal buflisted
#   }
# augroup END

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
