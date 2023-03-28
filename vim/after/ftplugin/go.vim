vim9script

setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

g:go_highlight_functions = 1


command CtagsGenerateGo :execute 'Start! ctags `find . -name "*.go" -print && find . -name "*.proto" -print`'
nnoremap <buffer> <F1> :CtagsGenerateGo<CR>
nnoremap <buffer> <F2> :GoImportRun<CR>


b:ale_linters = ['staticcheck']
g:ale_go_staticcheck_options = '-checks=["all","-ST1000","-ST1003","-ST1016","-ST1020","-ST1021","-ST1022","-ST1006"]'
g:ale_go_staticcheck_lint_package = 0

# b:ale_linters = ['golangci-lint']
# g:ale_go_golangci_lint_options = '--disable-all -E revive -E errcheck -E nilerr -E gosec'

# b:ale_linters = ['go vet']
# b:ale_go_go111module = 'off'
# g:ale_go_govet_options = ''

