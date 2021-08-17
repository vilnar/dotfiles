augroup AutoSettingsFileType
	autocmd!
	autocmd BufReadPre * if getfsize(expand("%")) > 500000 | syntax off | echoerr "Disable syntax highlighting depending on file size: " . getfsize(expand("%")) | endif
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd BufRead,BufNewFile .gitignore,.env.local,.env,.env.example,.env.test setlocal filetype=conf
augroup END
augroup KeepScreenPosition
	autocmd!
	autocmd BufWinLeave * let b:winview = winsaveview()
	autocmd BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview
augroup END
