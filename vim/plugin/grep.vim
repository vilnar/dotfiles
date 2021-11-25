" grep in project
" nnoremap <Leader>gg :AsyncRun grep -rni --exclude="tags" --exclude-dir=".git" -e '' ./<left><left><left><left>
vnoremap <Leader>gg y:AsyncRun grep -rni --exclude="tags" --exclude-dir=".git" -e '<C-R>"' ./

" grep in current directory
nnoremap <expr> <Leader>gd ":AsyncRun grep -rni -e '' " .  expand('%:h')
vnoremap <expr> <Leader>gd "y:AsyncRun grep -rni -e '<C-R>\"' " .  expand('%:h')

" grep by filetype
nnoremap <Leader>gi :AsyncRun grep -rni --include \*.go -e '' ./<left><left><left><left>

" grep in current file
nnoremap <Leader>gc :vimgrep //g % \| cw
vnoremap <expr> <Leader>gc "y:vimgrep /<C-R>\"/g % \| cw"


function! SearchInOpenedBuffers(pattern) abort
  execute 'cclose'
  execute 'cexpr []'
  " echomsg 'debug SearchInOpenedBuffers : ' . a:pattern
  execute 'bufdo vimgrepadd /' . a:pattern . '/g %'
  execute 'cwindow'
endfunction
command! -nargs=1 SearchInOpenedBuffers call SearchInOpenedBuffers(<f-args>)
