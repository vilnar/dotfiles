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

command! IndentationToSpaceConvert :setlocal expandtab|retab
command! IndentationToTabsConvert :setlocal noexpandtab|%retab!
command! IndentUsingSpace :setlocal expandtab
command! IndentUsingTab :setlocal expandtab!
