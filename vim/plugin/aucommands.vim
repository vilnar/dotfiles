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

# autocmd FileType fugitive set bufhidden=delete
# autocmd FileType fugitive set bufhidden=hide
autocmd FileType fugitive set bufhidden=
