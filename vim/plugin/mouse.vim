vim9script

set mouse=a
def MouseToggle()
  if &mouse == 'a'
    execute 'set mouse='
    echomsg 'Disable mouse'
  else
    execute 'set mouse=a'
    echomsg 'Enable mouse'
  endif
enddef
nnoremap <F3> :vim9cmd <SID>MouseToggle()<CR>
inoremap <F3> <ESC>:vim9cmd <SID>MouseToggle()<CR>
cnoremap <F3> <ESC>:vim9cmd <SID>MouseToggle()<CR>
