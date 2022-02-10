vim9script

# https://github.com/junegunn/fzf.vim
g:fzf_history_dir = '~/.fzf-history'
g:fzf_preview_window = []

nnoremap <silent><nowait> <leader>; :Commands<CR>
nnoremap <leader>tt :Tags <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>tb :BTags <C-R>=expand("<cword>")<CR><CR> 
nnoremap <leader>tf :BTags<CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>

# https://github.com/sharkdp/fd
$FZF_DEFAULT_COMMAND = 'fdfind --hidden --exclude .git --no-ignore'
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
