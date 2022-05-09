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


set cursorline
augroup MyCursorLine
  autocmd VimEnter,WinEnter,BufWinEnter,WinLeave,BufWinLeave * {
    if &diff
      # set nocursorline
      highlight CursorLine    cterm=underline ctermbg=NONE gui=underline guibg=NONE
      highlight CursorColumn  cterm=underline ctermbg=NONE gui=underline guibg=NONE
    else
      # set cursorline
      highlight CursorLine    cterm=NONE ctermbg=DarkGrey gui=NONE guibg=#333333
      highlight CursorColumn  cterm=NONE ctermbg=DarkGrey gui=NONE guibg=#333333 
    endif
  }
augroup END
