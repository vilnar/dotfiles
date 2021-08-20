function! CreateScratchByName(name) abort
	enew
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
	execute 'file ' . a:name
endfunction

function! CreateFilesScratch() abort
	let name = '__Files__'
	let bufnumber = bufnr(name)
	if bufnumber == -1
		call CreateScratchByName(name)
	else
		execute 'bdelete ' . name
		call CreateScratchByName(name)
	endif
endfunction

" Read from shell and move to new buffer
command! -nargs=* -complete=shellcmd FilesBuffer call CreateFilesScratch() | r <args>
" command! -nargs=* -complete=shellcmd FilesBuffer enew | setlocal buftype=nofile bufhidden=hide noswapfile | r <args>

" find file
nnoremap <Leader>ff :FilesBuffer !find ./ -not -path "./.git/*" -iname ""<left>
nnoremap <Leader>fu :FilesBuffer !find ./ -not -path "./.git/*" -name "<C-R><C-W>*"<left>
nnoremap <Leader>fp :FilesBuffer !find ./ -not -path "./.git/*" -path "**"<left><left>
vnoremap <Leader>fp y:FilesBuffer !find ./ -not -path "./.git/*" -path "*<C-R>"*"<left><left>
