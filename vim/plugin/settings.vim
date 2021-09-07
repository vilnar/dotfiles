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


" :help bufexplorer
let g:fugitive_dynamic_colors = 0
let g:bufExplorerShowNoName = 1
let g:bufExplorerSortBy = "mru"
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerDisableDefaultKeyMapping = 1
nnoremap <silent> <leader>b :BufExplorerHorizontalSplit<CR>


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


" :help extags
nnoremap <leader>t :TSelect <c-r>=expand("<cword>")<cr><CR>
