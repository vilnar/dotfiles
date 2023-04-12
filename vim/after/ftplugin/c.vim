vim9script

command CtagsGenerateForC :execute "Start! fdfind --type f --hidden --exclude .git --no-ignore --glob '*.[ch]' | xargs ctags"
nnoremap <buffer> <F1> :CtagsGenerateForC<CR>

# Linux kernel coding style
setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

setlocal commentstring=//\ %s

b:codefmt_formatter = 'clang-format'

# b:ale_linters = ['clangtidy']
# g:ale_c_clangtidy_options = '-I /usr/include/python3.10'
