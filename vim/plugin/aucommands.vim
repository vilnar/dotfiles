vim9script

augroup AutoSettingsFileType
  autocmd FileType * {
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  }
  autocmd BufRead,BufNewFile .gitignore,.env.local,.env,.env.example,.env.test,*.conf {
    setlocal filetype=conf
  }
augroup END

# augroup KeepScreenPosition
#   autocmd BufWinLeave * {
#     var winview = winsaveview()
#   }
#   autocmd BufWinEnter * {
#     if exists('winview') | winrestview(winview) | unvar winview
#   }
# augroup END
