vim9script

augroup AutoSettingsFileType
  autocmd FileType * {
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  }
  autocmd BufRead,BufNewFile .gitignore,.env.local,.env,.env.example,.env.test,*.conf {
    setlocal filetype=conf
  }
augroup END

augroup KeepScreenPosition
  autocmd BufWinLeave * {
    b:winviewCustom = winsaveview()
  }
  autocmd BufWinEnter * {
    if exists('b:winviewCustom')
      echomsg "Debug BufWinEnter"
      winrestview(b:winviewCustom)
      unlet b:winviewCustom
    endif
  }
augroup END
