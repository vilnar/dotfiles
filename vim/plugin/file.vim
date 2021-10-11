set autoread
set autowrite

command! PathDirectoryAbsoluteCopy :let @+=expand('%:p:h')
command! PathDirectoryRelativeCopy :let @+=expand('%:h')
command! PathFileAbsoluteCopy :let @+=expand('%:p')
command! PathFileRelativeCopy :let @+=expand('%')

command! FileNameCopy :let @+=expand('%:t')

command! FileFormatShow :echo &fileformat
command! FileTypeShow :echo &filetype
command! FileTabSizeShow :echo &tabstop
command! FileNoEndOfLineToggle :setlocal nofixendofline!


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
command! FileEncodingShow :echo &fileencoding?&fileencoding:&encoding
command! CdToFile :execute 'cd ' . expand('%:p:h')
