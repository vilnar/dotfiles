vim9script

# https://github.com/junegunn/fzf.vim
g:fzf_history_dir = '~/.fzf-history'
# g:fzf_preview_window = []

# $FZF_DEFAULT_OPTS = '+i'

def RunMyTags(query: string)
  # +i - Case-sensitive match
  var spec = {"options": ["+i"], "placeholder": "--tag {2}:{-1}:{3..}"}
  call fzf#vim#tags(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=* MyTags call RunMyTags(<q-args>)

def RunMyBufferTags(query: string)
  var spec = {"options": ["+i"], "placeholder": "{2}:{3..}"}
  call fzf#vim#buffer_tags(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=* MyBufferTags call RunMyBufferTags(<q-args>)

nnoremap <silent><nowait> <leader>; :Commands<CR>
# nnoremap <leader>tt :Tags '<C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>tt :MyTags <C-R>=expand("<cword>")<CR><CR>
# nnoremap <leader>tb :BTags '<C-R>=expand("<cword>")<CR><CR> 
nnoremap <leader>tb :MyBufferTags <C-R>=expand("<cword>")<CR><CR> 
nnoremap <leader>tf :BTags<CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>


def RunMyFiles(query: string)
  # hide preview window
  var spec = {"options": ['--preview-window', 'hidden']}
  call fzf#vim#files(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=? -complete=dir MyFiles call RunMyFiles(<q-args>)

# https://github.com/sharkdp/fd
$FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --exclude .git --no-ignore'
nnoremap <silent><nowait> <leader>ff :MyFiles<CR>
nnoremap <silent><nowait> <leader>fc :MyFiles <C-R>=expand("%:h")<CR>/<CR>
nnoremap <expr> <leader>fu ':MyFiles<CR>' .. expand('<cword>')

def GotoSelection()
  var text = getreg('"')
  # replace for php namespaces
  text = substitute(text, '\', '/', 'g')
  exec ":MyFiles"
  feedkeys(text)
enddef
xnoremap <leader>ff y:vim9cmd <SID>GotoSelection()<CR>
