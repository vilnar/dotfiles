" https://github.com/junegunn/fzf.vim
let g:fzf_history_dir = '~/.fzf-history'

nnoremap <silent><nowait> <leader>; :Commands<CR>
nnoremap <silent><nowait> <leader>fc :Files <C-R>=expand("%:h")<CR>/<CR>
nnoremap <leader>t :Tags <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>

nnoremap <silent><nowait> <leader>ff :Files<CR>
nnoremap <expr> <leader>fu ':Files<CR>' . expand('<cword>')

function! FilesSelectedSearch()
  let raw_search=getreg('"')
  exec ":Files"
  call feedkeys(raw_search)
endfunction
xnoremap <leader>ff y:call FilesSelectedSearch()<CR>
