vim9script

# https://github.com/junegunn/fzf.vim
g:fzf_history_dir = '~/.fzf-history'

nnoremap <silent><nowait> <leader>; :Commands<CR>
nnoremap <leader>t :Tags <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>

# https://github.com/sharkdp/fd
$FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --exclude .git --no-ignore'
g:fzf_preview_window = []
nnoremap <silent><nowait> <leader>ff :Files<CR>
nnoremap <silent><nowait> <leader>fc :Files <C-R>=expand("%:h")<CR>/<CR>
nnoremap <expr> <leader>fu ':Files<CR>' .. expand('<cword>')

def GotoSelection()
  var text = getreg('"')
  # replace for php namespaces
  text = substitute(text, '\', '/', 'g')
  exec ":Files"
  feedkeys(text)
enddef
xnoremap <leader>ff y:vim9cmd <SID>GotoSelection()<CR>
