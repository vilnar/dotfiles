if !exists("*ReloadConfigs")
  function ReloadConfigs()
    let is_buffer_empty = line('$') == 1 && getline(1) == ''
    let is_name_buffer_empty = bufname() == ''
    if !is_buffer_empty && !is_name_buffer_empty
      execute 'write'
    endif
    execute 'source ~/.vimrc'
    execute 'source ~/.vim/plugin/mappings.vim'
    execute 'source ~/.vim/plugin/settings.vim'
    execute 'source ~/.vim/plugin/custom.vim'
    execute 'source ~/.vim/plugin/tui.vim'
    if has("gui_running")
      execute 'source ~/.vim/.gvimrc'
    endif
    if !is_buffer_empty && !is_name_buffer_empty
      execute 'edit'
    endif
    echomsg 'reload config done'
  endfunction
endif
command! ReloadConfigs :call ReloadConfigs()

command! SettingsShowAll :enew | put=execute('set all')


" :help netrw
" let g:netrw_banner = 0
" disable plugin netrw
" let loaded_netrwPlugin = 1


" :help php.vim
let php_special_functions = 0


" :help NERDTree
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=40
let g:NERDTreeMinimalUI=0
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrows=1
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeRemoveFileCmd = "gio trash "
let g:NERDTreeRemoveDirCmd = "gio trash "
let g:NERDTreeHijackNetrw = 0
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>




" :help UltiSnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-d>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" :help asyncrun
let g:asyncrun_open = 8
let g:asyncrun_save = 2


" https://github.com/junegunn/fzf.vim

nnoremap <silent><nowait> <leader>; :Commands<CR>
nnoremap <silent><nowait> <leader>fz :Files<CR>
" nnoremap <silent> <Space>. :Files <C-r>=expand("%:h")<CR>/<CR>




" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview(), <bang>0)
" nnoremap <silent><nowait> <leader>gg :Rg<CR>

" set up an rg command with options for reuse. Refer to the other gist file (.zshrc) for details on $RG_COMMAND_BASE
let g:rg_command = 'rg --column --line-number --no-heading --color "always"'

" concatenate together all the necessary options for the final call to the rg command
fun! BuildRgCommand(opts, qargs)
  let l:list = [g:rg_command] + a:opts + ['--', shellescape(a:qargs)]
  return join(l:list, ' ')
endfun

" construct the rg command and pass it to the fzf grep command with all necessary options
fun! Fzf_grep(opts, qargs, bang) abort
  let l:rg = BuildRgCommand(a:opts, a:qargs)
  call fzf#vim#grep(l:rg, 1, {}, a:bang)
endfun

" custom commands

" Search literal string recursive ignoring case
command! -bang -nargs=* RG call Fzf_grep(['--ignore-case', '--fixed-strings'], <q-args>, <bang>0)
command! -bang -nargs=* RGI call Fzf_grep(['--ignore-case', '--fixed-strings', '--no-ignore'], <q-args>, <bang>0)

" Search literal string recursive case sensitive
command! -bang -nargs=* RGS call Fzf_grep(['--fixed-strings'], <q-args>, <bang>0)
command! -bang -nargs=* RGSI call Fzf_grep(['--fixed-strings', '--no-ignore'], <q-args>, <bang>0)

" Search recursive case sensitive as RegExp (using ripgrep RegExp engine, _not_ vim RegExp engine)
command! -bang -nargs=* RGX call Fzf_grep([], <q-args>, <bang>0)

" Seach literal string recursive case sensitive with word boundaries
command! -bang -nargs=* RGSW call Fzf_grep(['-w', '--fixed-strings'], <q-args>, <bang>0)

" Search files for word under cursor
nnoremap <silent><leader>gu "zyiw :let cmd = 'RGSW ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd<cr>

" Search files for visually selected text
xnoremap <silent><leader>gg "zy :let cmd = 'RGS ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd <cr>

let g:fzf_history_dir = '~/.fzf-history'
nnoremap <silent><nowait> <leader>gg :RG <CR>

nnoremap <silent><nowait> <leader>gi :RGI <CR>
xnoremap <silent><leader>gi "zy :let cmd = 'RGSI ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd <cr>


nnoremap <leader>t :Tags <c-r>=expand("<cword>")<cr><CR>


nnoremap <silent><nowait> <leader>b :Buffers<CR>

" :help bufexplorer
" let g:fugitive_dynamic_colors = 0
" let g:bufExplorerShowNoName = 1
" let g:bufExplorerSortBy = "mru"
" let g:bufExplorerShowRelativePath = 1
" let g:bufExplorerDisableDefaultKeyMapping = 1
" nnoremap <silent> <leader>b :BufExplorerHorizontalSplit<CR>

nnoremap <silent><nowait> <leader>i :Snippets<CR>
