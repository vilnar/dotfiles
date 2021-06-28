if !exists('g:sessionPath')
	finish
endif

function! s:SessionOpen(path)
	if a:path != '' && a:path[0] != '"' && exists('a:path')
		execute 'source ' . a:path
	endif
endfunction

function! s:SessionWrite(path)
	if a:path != '' && a:path[0] != '"' && exists('a:path')
		execute ':mksession! ' . a:path
	endif
endfunction

function! s:SessionFilesComplete(A, L, P)
	return glob(g:sessionPath . '/*')
endfunction

command! -nargs=1 -complete=custom,s:SessionFilesComplete Sopen call s:SessionOpen(<f-args>)
command! -nargs=1 -complete=custom,s:SessionFilesComplete Swrite call s:SessionWrite(<f-args>)


command! SpathOpen :execute 'edit ' . g:sessionPath

function! s:SessionSave()
	if exists('v:this_session')
		execute 'mksession! ' . v:this_session
	endif
endfunction
command! SsaveThis call s:SessionSave()
