if !exists('loaded_nerd_tree')
    finish
endif

" disable plugin netrw
" let loaded_netrwPlugin = 1

" nerdtree
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrows=1
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeNodeDelimiter = "\u00a0"

nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

" fix vim session + nerdtree
set sessionoptions-=blank

autocmd VimEnter * call NERDTreeAddKeyMap({
			\ 'key': 'yy',
			\ 'callback': 'NERDTreeYankFullPath',
			\ 'quickhelpText': 'put full path of current node into the default register' })

function! NERDTreeYankFullPath()
	let n = g:NERDTreeFileNode.GetSelected()
	if n != {}
		let full_path = n.path.str()
		execute "let @+=full_path"
		call nerdtree#echo("Copy absolute path " . full_path)
	endif
endfunction

autocmd VimEnter * call NERDTreeAddKeyMap({
			\ 'key': 'yr',
			\ 'callback': 'NERDTreeYankRelativePath',
			\ 'quickhelpText': 'put relative path of current node into the default register' })

function! NERDTreeYankRelativePath()
	let n = g:NERDTreeFileNode.GetSelected()
	if n != {}
		let rel_path = fnamemodify(n.path.str(), ':.')
		execute "let @+=rel_path"
		call nerdtree#echo("Copy relative path " . rel_path)
	endif
endfunction

autocmd VimEnter * call NERDTreeAddKeyMap({
			\ 'key': 'yn',
			\ 'callback': 'NERDTreeYankName',
			\ 'quickhelpText': 'put file name of current node into the default register' })

function! NERDTreeYankName()
	let n = g:NERDTreeFileNode.GetSelected()
	if n != {}
		let file_name = fnamemodify(n.path.str(), ':t')
		execute "let @+=file_name"
		call nerdtree#echo("Copy file name " . file_name)
	endif
endfunction


" function s:ExploreCurrenFolder()
" 	let current_folder = expand("%:h")
" 	if current_folder == ""
" 		let current_folder = getcwd()
" 	endif
" 	execute "edit " . current_folder
" endfunction
" command! Ex :call s:ExploreCurrenFolder()
