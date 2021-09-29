set mouse=a
function! MouseToggle()
  if &mouse == 'a'
    set mouse=
  else
    set mouse=a
  endif
endfunction
nnoremap <Leader>2 :call MouseToggle()<CR>
