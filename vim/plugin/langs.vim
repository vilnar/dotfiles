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
