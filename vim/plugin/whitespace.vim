vim9script

# Trailing whitespace and tabs are forbidden, so highlight them.
highlight ForbiddenWhitespace ctermbg=grey guibg=#a8a8a8

autocmd BufWinEnter <buffer> match ForbiddenWhitespace /\s\+$/
autocmd InsertEnter <buffer> match ForbiddenWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave <buffer> match ForbiddenWhitespace /\s\+$/
autocmd BufWinLeave <buffer> call clearmatches()
