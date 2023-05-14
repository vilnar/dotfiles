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
      # setlocal list
    else
      setlocal syntax=ON
      # setlocal list!
    endif
  }
  # vimdiff
  autocmd VimEnter * {
    if &diff
      getwininfo()->map((_, v) => win_execute(v.winid, 'setlocal syntax=OFF'))
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
