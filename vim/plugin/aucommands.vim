vim9script

augroup AutoSettingsFileType
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
      winrestview(b:winviewCustom)
      unlet b:winviewCustom
    endif
  }
augroup END

augroup MyCursorLine
 autocmd BufEnter * {
    if &diff
      set nocursorline
    else
      set cursorline
    endif
  }
augroup END
