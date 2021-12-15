set autoread
set autowrite

command! PathDirCopyAbsolute :let @+=expand('%:p:h')
command! PathDirCopyRelative :let @+=expand('%:h')
command! PathFileCopyAbsolute :let @+=expand('%:p')
command! PathFileCopyRelative :let @+=expand('%')

command! FileCopyName :let @+=expand('%:t')

command! EditorShowLineEncoding :echo &fileformat
command! EditorShowType :echo &filetype

function! FileRename() abort
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    execute 'saveas ' . new_name
    execute 'silent !rm ' . old_name
    redraw!
  endif
endfunction
command! FileRename :call FileRename()


" Open current file with Encode
nnoremap <Leader>ee :edit ++enc= %<left><left>

" command! FileEncodeReopenWithWinCyrilic :e ++enc=cp1251
command! EncodeDetectThis :!chardet3 %
command! EncodingSupportedShow :help encoding-values
command! EncodingShow :echo &fileencoding?&fileencoding:&encoding
command! CdToFile :execute 'cd ' . expand('%:p:h')
