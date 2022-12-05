vim9script

setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab


command CtagsGenerateGo :execute 'Start! ctags `find . -name "*.go" -print && find . -name "*.proto" -print`'
nnoremap <buffer> <F1> :CtagsGenerateGo<CR>
nnoremap <buffer> <F2> :GoImportRun<CR>


b:ale_linters = ['staticcheck']
g:ale_go_staticcheck_options = '-checks=["all","-ST1000","-ST1003","-ST1016","-ST1020","-ST1021","-ST1022","-ST1006"]'
