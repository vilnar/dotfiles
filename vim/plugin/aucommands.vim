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
    else
      setlocal syntax=ON
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
