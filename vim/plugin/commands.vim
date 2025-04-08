vim9script

augroup AutoSettingsFileType
  autocmd BufRead,BufNewFile .gitignore,.env.local,.env,.env.example,.env.test,*.conf {
    setlocal filetype=conf
  }
  autocmd BufRead,BufNewFile www.conf {
    setlocal filetype=dosini
  }
  autocmd BufRead,BufNewFile *.gohtml {
    setlocal filetype=html
  }
augroup END

# augroup DiffOption
#   autocmd OptionSet diff {
#     if &diff
#       setlocal syntax=OFF
#       setlocal list
#     else
#       setlocal syntax=ON
#       setlocal list!
#     endif
#   }
#   # vimdiff
#   autocmd VimEnter * {
#     if &diff
#       getwininfo()->map((_, v) => win_execute(v.winid, 'setlocal syntax=OFF list'))
#     endif
#   }
# augroup END

augroup netrw_mapping
  autocmd filetype netrw call NetrwMapping()
augroup END


def NetrwCopyPath()
  var path = netrw#Call('NetrwFile', netrw#Call('NetrwGetWord')) 
  @+ = path
  echo "copied to clipboard path: " .. path
enddef

def NetrwMapping()
  noremap <buffer> y :vim9cmd <SID>NetrwCopyPath()<CR>
enddef

augroup fern_mapping
  autocmd filetype fern call FernMapping()
augroup END

def FernCopyPath()
  var helper = fern#helper#new()
  var node = helper.sync.get_cursor_node()
  var path = node._path
  @+ = path
  echo "copied to clipboard path: " .. path
enddef

def FernCopyName()
  var helper = fern#helper#new()
  var node = helper.sync.get_cursor_node()
  var path = node.name
  @+ = path
  echo "copied to clipboard name: " .. path
enddef

def FernMapping()
  noremap <buffer> yy :vim9cmd <SID>FernCopyPath()<CR>
  noremap <buffer> yn :vim9cmd <SID>FernCopyName()<CR>
  noremap <buffer> o <Plug>(fern-action-preview)
enddef

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
