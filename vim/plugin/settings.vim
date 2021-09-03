let g:fugitive_dynamic_colors = 0
let g:bufExplorerShowNoName = 1
let g:bufExplorerSortBy = "mru"
let g:bufExplorerShowRelativePath = 1
let g:bufExplorerDisableDefaultKeyMapping = 1
nnoremap <silent> <leader>b :BufExplorerHorizontalSplit<CR>

let php_special_functions = 0

let g:UltiSnipsSnippetDirectories=["UltiSnips", "customsnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-d>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


let g:asyncrun_open = 8
let g:asyncrun_save = 2



" find in tags by plugin ex-tags
nnoremap <leader>t :TSelect <c-r>=expand("<cword>")<cr><CR>


let g:VM_mouse_mappings = 1
