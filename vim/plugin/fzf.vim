" https://github.com/junegunn/fzf.vim
let g:fzf_history_dir = '~/.fzf-history'

nnoremap <silent><nowait> <leader>; :Commands<CR>
nnoremap <silent><nowait> <leader>ff :Files<CR>
nnoremap <silent><nowait> <leader>fc :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <leader>t :Tags <c-r>=expand("<cword>")<cr><CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>


" FZF_GREP --------------------------------------------------------------------------------------------
" let g:rg_command = 'rg --column --line-number --no-heading --color "always"'

" concatenate together all the necessary options for the final call to the rg command
" function! BuildRgCommand(opts, qargs)
"   let l:list = [g:rg_command] + a:opts + ['--', shellescape(a:qargs)]
"   return join(l:list, ' ')
" endfunction

" construct the rg command and pass it to the fzf grep command with all necessary options
" function! Fzf_grep(opts, qargs, bang) abort
"   let l:rg = BuildRgCommand(a:opts, a:qargs)
"   call fzf#vim#grep(l:rg, 1, fzf#vim#with_preview(), a:bang)
" endfunction

" Search literal string recursive ignoring case
" command! -bang -nargs=* RG call Fzf_grep(['--ignore-case', '--fixed-strings'], <q-args>, <bang>0)
" command! -bang -nargs=* RGI call Fzf_grep(['--ignore-case', '--fixed-strings', '--no-ignore'], <q-args>, <bang>0)

" Search literal string recursive case sensitive
" command! -bang -nargs=* RGS call Fzf_grep(['--fixed-strings'], <q-args>, <bang>0)
" command! -bang -nargs=* RGSI call Fzf_grep(['--fixed-strings', '--no-ignore'], <q-args>, <bang>0)

" Search recursive case sensitive as RegExp (using ripgrep RegExp engine, _not_ vim RegExp engine)
" command! -bang -nargs=* RGX call Fzf_grep([], <q-args>, <bang>0)

" Seach literal string recursive case sensitive with word boundaries
" command! -bang -nargs=* RGSW call Fzf_grep(['-w', '--fixed-strings'], <q-args>, <bang>0)

" Search files for visually selected text
" xnoremap <silent><leader>gg "zy :let cmd = 'RGS ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd <cr>

" nnoremap <silent><nowait> <leader>gg :RG <CR>

" no ignore
" nnoremap <silent><nowait> <leader>gi :RGI <CR>
" xnoremap <silent><leader>gi "zy :let cmd = 'RGSI ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd <cr>

" Search files for word under cursor
" nnoremap <silent><leader>gu "zyiw :let cmd = 'RGSW ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd<cr>

