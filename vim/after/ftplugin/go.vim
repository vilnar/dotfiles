vim9script

setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab


command CtagsGenerateGo :execute 'Start! ctags `find . -name "*.go" -print && find . -name "*.proto" -print`'
nnoremap <F1> :CtagsGenerateGo<CR>
nnoremap <F2> :GoImportRun<CR>
