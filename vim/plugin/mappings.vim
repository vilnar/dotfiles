vim9script

import "./fzf.vim" as fzf
import "./grep.vim" as grep
import "./layout.vim" as layout
import "./quickfix.vim" as quickfix
import "./search_replace.vim" as search_replace
import "./mouse.vim" as mouse
import "./settings.vim" as settings
import "./langs.vim" as langs

# OS clipboard yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>d "+d


# Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

# don't use Ex mode, use Q for formatting
nnoremap Q gq
nnoremap <C-LeftMouse> <nop>


nnoremap <Leader>h :nohlsearch<CR>


# Move and indent lines on Ctrl+j and Ctrl+k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


def CopyWithoutNewLine()
  execute ':normal ^vg_"+y'
  echomsg "copy line: " .. line(".")
enddef
nnoremap <Leader>l :vim9cmd <SID>CopyWithoutNewLine()<CR>

# highlight
def RunSearchUnderCursor()
  var scom = '\<' .. expand('<cword>') .. '\>'
  @/ = scom
  histadd('/', scom)
enddef
nnoremap <silent> <Leader>8 :vim9cmd <SID>RunSearchUnderCursor()<BAR>set hls<CR>



# BUFFER -----------------------------------------------------------------------------
nnoremap <leader>o :only<CR>
nnoremap <leader>c :close<CR>

# tabs switching
# nnoremap <Leader>t :tabs<CR>:tabnext<Space>

# buffers list
# nnoremap <Leader>bl :setlocal nomore <Bar> :ls t <Bar> :setlocal more <CR>:b<Space>
# nnoremap <Leader>b :ls<CR>:b<SPACE>
nnoremap <silent> <leader>b :Buffers<CR>


# close current buffer
nnoremap <Leader>q :bdelete %<CR>



# FILE -----------------------------------------------------------------------------
# Open current file with Encode
# nnoremap <Leader>ee :edit ++enc= %<left><left>



# FIND FILE -----------------------------------------------------------------------------
# nnoremap <Leader>ff :FilesBuffer !find * -not -path "./.git/*" -iname ""<left>
# nnoremap <Leader>fu :FilesBuffer !find * -not -path "./.git/*" -name "<C-R><C-W>*"<left>
nnoremap <Leader>fp :vim9cmd FilesBuffer !find * -not -path "./.git/*" -iname "**"<left><left>
vnoremap <Leader>fp y:vim9cmd FilesBuffer !find * -not -path "./.git/*" -path "*<C-R>"*"<left><left>



# FZF -----------------------------------------------------------------------------
nnoremap <silent><nowait> <leader>; :Commands<CR>
# nnoremap <leader>tt :Tags '<C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>tt :MyTags <C-R>=expand("<cword>")<CR><CR>
# nnoremap <leader>tb :BTags '<C-R>=expand("<cword>")<CR><CR> 
nnoremap <leader>tb :MyBufferTagsCaseSensitive <C-R>=expand("<cword>")<CR><CR> 
# nnoremap <leader>tf :BTags<CR>
nnoremap <leader>tf :MyBufferTags<CR>
nnoremap <silent><nowait> <leader>i :Snippets<CR>

nnoremap <silent><nowait> <leader>ff :MyFiles<CR>
nnoremap <silent><nowait> <leader>fc :MyFiles <C-R>=expand("%:h")<CR>/<CR>
nnoremap <expr> <leader>fu ':MyFiles<CR>' .. expand('<cword>')
xnoremap <leader>ff y:vim9cmd <SID>fzf.GotoSelection()<CR>
nnoremap <leader>mm :Marks<CR>



# GREP -----------------------------------------------------------------------------
nnoremap <Leader>gg :Dispatch grep -rni --exclude="tags" --exclude-dir=".git" '' ./<left><left><left><left>
vnoremap <Leader>gg y:Dispatch grep -rn --exclude="tags" --exclude-dir=".git" '<C-R>"' ./
# grep in current directory
nnoremap <expr> <Leader>gd ":Dispatch grep -rni '' " ..  <SID>grep.GetRelativePathForGrep()
vnoremap <expr> <Leader>gd "y:Dispatch grep -rn '<C-R>\"' " ..  <SID>grep.GetRelativePathForGrep()

# grep by filetype
nnoremap <Leader>gi :Dispatch grep -rn --include=*.go '' ./<left><left><left><left>

# grep in current buffer
noremap <expr> <Leader>gb ":Dispatch grep -nirH '' " .. expand('%') 
vnoremap <expr> <Leader>gb "y:Dispatch grep -nrH '<C-R>\"' " .. expand('%') 

# grep for regex (-P is enable PATTERNS are Perl regular expressions)
# nnoremap <Leader>gr :Dispatch grep -nroHP '' ./<left><left><left><left>
nnoremap <expr> <Leader>gr ":Dispatch grep -nroHP '' " .. expand('%')



# LANGS -----------------------------------------------------------------------------
# ctrl+^ for change keymap in INSERT mode
set keymap=ukrainian-enhanced
set iminsert=0 # Default - latin layout
set imsearch=0 # Default - latin layout in sea
inoremap <C-\> <C-^>



# LAYOUT -----------------------------------------------------------------------------
# move selected to new tab
xnoremap <leader>ms y:vim9cmd <SID>layout.OpenNewTabWithSelectedText()<CR>
nnoremap <Leader>mt :tab split<CR>

# nnoremap <Leader>w <C-w>w
nnoremap <Leader>w <C-w>p
nnoremap <Leader>1 1<C-w>w
nnoremap <Leader>2 2<C-w>w
nnoremap <Leader>3 3<C-w>w
nnoremap <Leader>4 4<C-w>w
nnoremap <Leader>5 5<C-w>w
nnoremap <Leader>6 6<C-w>w



# QUICKFIX -----------------------------------------------------------------------------
nnoremap <silent> <leader>\ :vim9cmd <SID>quickfix.QuickFixToggle()<CR>



# SEARCH AND REPLACE -----------------------------------------------------------------------------
vnoremap * y:vim9cmd <SID>search_replace.EscapeSearchTextMultiLines(getreg('"'), '\n')<CR>
nnoremap <Leader>sm :SearchMultiLine<space>
nnoremap <Leader>se :SearchEscape<space>
vnoremap <Leader>se y:vim9cmd <SID>search_replace.EscapeSearchText(getreg('"'))<CR>

vnoremap <Leader>ss y/<C-R>"

nnoremap <Leader>rr :%s///gc<left><left><left><left>
vnoremap <Leader>rr y:vim9cmd <SID>search_replace.EscapeTextForReplace(false)<CR>
vnoremap <Leader>rb <Esc>:'<,'>s///gc<left><left><left><left>

nnoremap <Leader>ru viwy:vim9cmd <SID>search_replace.EscapeTextForReplace(true)<CR>
vnoremap <Leader>rw y:vim9cmd <SID>search_replace.EscapeTextForReplace(true)<CR>

vnoremap <Leader>rv <Esc>:'<,'>s/\<\>\C//gc<left><left><left><left><left><left><left><left>



# F keys -----------------------------------------------------------------------------
nnoremap <F3> :vim9cmd <SID>mouse.MouseToggle()<CR>
inoremap <F3> <ESC>:vim9cmd <SID>mouse.MouseToggle()<CR>
cnoremap <F3> <ESC>:vim9cmd <SID>mouse.MouseToggle()<CR>
nnoremap <F5> :vim9cmd <SID>settings.ReloadConfigs()<CR>
nnoremap <F6> :vim9cmd <SID>langs.RunSpellUkToggle()<CR>
noremap <F7> :tabnew<CR>
noremap <F8> :set wrap!<CR>

# show whitespace
nnoremap <F9> :set list!<CR>
inoremap <F9> <ESC>:set list!<CR>
cnoremap <F9> <ESC>:set list!<CR>

# clear whitespace in block
vnoremap <F10> <Esc>:'<,'>WhiteSpaceTrailClear<CR>

nnoremap <F12> :vim9cmd AsyncStop<CR>
inoremap <F12> <ESC>:vim9cmd AsyncStop<CR>
cnoremap <F12> <ESC>:vim9cmd AsyncStop<CR>



# PROJECTS -----------------------------------------------------------------------------
nnoremap <leader>0 :ProjectsShow<CR>



# PLUGINS -----------------------------------------------------------------------------
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

g:UltiSnipsExpandTrigger = "<tab>"
# list all snippets for current filetype
g:UltiSnipsListSnippets = "<c-d>"
g:UltiSnipsExpandTrigger = "<tab>"
g:UltiSnipsJumpForwardTrigger = "<c-b>"
g:UltiSnipsJumpBackwardTrigger = "<c-z>"


# help codefmt
vnoremap <leader>= <Esc>:'<,'>FormatLines<CR>

# LSP
augroup LspGo
  var gopls_settings = {
    'name': 'gopls',
    'cmd': ['gopls'],
    'allowlist': ['go'],
    'initialization_options': {
      "linksInHover": false,
      "linkTarget": "",
    },
    }
  autocmd User lsp_setup call lsp#register_server(gopls_settings)
  autocmd FileType go setlocal omnifunc=lsp#complete
  autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
  autocmd FileType go nmap <buffer> ,r <plug>(lsp-references)
  autocmd FileType go nmap <buffer> ,i <plug>(lsp-implementation)
  autocmd FileType go nmap <buffer> ,t <plug>(lsp-type-definition)
  autocmd FileType go nmap <buffer> ,h <plug>(lsp-hover)
  autocmd FileType go nmap <buffer> ,d <plug>(lsp-document-diagnostics)
  autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
  autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
augroup END

nnoremap <silent> ,1 :call lsp#enable()<bar>echo "LSP enabled"<CR>
nnoremap <silent> ,2 :call lsp#disable()<bar>echo "LSP disabled"<CR>
