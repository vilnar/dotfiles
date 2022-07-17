vim9script

augroup AutoSettingsFileType
  autocmd BufRead,BufNewFile .gitignore,.env.local,.env,.env.example,.env.test,*.conf {
    setlocal filetype=conf
  }
  autocmd BufRead,BufNewFile www.conf {
    setlocal filetype=dosini
  }
augroup END

augroup KeepScreenPosition
  autocmd BufWinLeave * {
    b:winviewCustom = winsaveview()
  }
  autocmd BufWinEnter * {
    if exists('b:winviewCustom')
      winrestview(b:winviewCustom)
      unlet b:winviewCustom
    endif
  }
augroup END

augroup FugitiveCustom
  autocmd FileType fugitive setlocal bufhidden=
  autocmd FileType git {
    setlocal foldmethod=syntax
    setlocal bufhidden=
    setlocal buflisted
  }
augroup END
