function! QuickFixToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen 8
  else
    cclose
  endif
endfunction

nnoremap <silent> <leader>3 :call QuickFixToggle()<CR>
