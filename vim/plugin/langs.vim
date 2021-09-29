" help spell
" `z=` - Finding suggestions for bad words
function! SpellEnToggle()
  setlocal spell! spelllang=en_us
endfunction
command! SpellEnToggle :call SpellEnToggle()

function! SpellUkToggle()
  setlocal spell! spelllang=uk
endfunction
command! SpellUkToggle :call SpellUkToggle()



" ctrl+^ for change keymap in INSERT mode
set keymap=ukrainian-enhanced
set iminsert=0 " Default - latin layout
set imsearch=0 " Default - latin layout in sea
inoremap <C-\> <C-^>
