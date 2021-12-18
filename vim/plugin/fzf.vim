vim9script

# https://github.com/junegunn/fzf.vim
g:fzf_history_dir = '~/.fzf-history'

nnoremap <silent><nowait> <leader>; :Commands<CR>
nnoremap <leader>t :Tags <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>


nnoremap <silent><nowait> <leader>ff :Files<CR>
nnoremap <silent><nowait> <leader>fc :Files <C-R>=expand("%:h")<CR>/<CR>
nnoremap <expr> <leader>fu ':Files<CR>' .. expand('<cword>')

def FilesSelectedSearch()
  var raw_search = getreg('"')
  exec ":Files"
  feedkeys(raw_search)
enddef
xnoremap <leader>ff y:vim9cmd <SID>FilesSelectedSearch()<CR>
