command! WhiteSpaceTrailSearch /\s\+$
function! WhiteSpaceTrailClearInRange() range
  " echomsg "debug line " . get(a:, 'firstline', 0)
  execute "" . a:firstline . "," . a:lastline . "s/\\s\\+$//e"
endfunction
command! -range WhiteSpaceTrailClear <line1>,<line2>call WhiteSpaceTrailClearInRange()
" clear whitespace in block
" vnoremap <F10> <Esc>:'<,'>s/\s\+$//e<CR>


" show whitespace
noremap <F6> :set list!<CR>
inoremap <F6> :set list!<CR>
cnoremap <F6> :set list!<CR>

