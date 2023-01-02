vim9script

import "../lib/fzf.vim" as fzfLib
import "../lib/grep.vim" as grepLib
import "../lib/layout.vim" as layoutLib
import "../lib/quickfix.vim" as quickfixLib
import "../lib/search_replace.vim" as searchReplaceLib
import "../lib/mouse.vim" as mouseLib
import "../lib/settings.vim" as settingLib
import "../lib/langs.vim" as langLib
import "../lib/file.vim" as fileLib
import "../lib/buffer.vim" as bufferLib
import "../lib/whitespace.vim" as whitespaceLib

# OS clipboard yank and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P
# noremap <Leader>d "+d

# Easier moving of code blocks
# use > and repeat by .
# vnoremap < <gv
# vnoremap > >gv

# don't use Ex mode, use Q for formatting
nnoremap Q <NOP>
nnoremap gq <NOP>
nnoremap <C-LeftMouse> <NOP>


nnoremap <Leader>h :nohlsearch<CR>

# https://vi.stackexchange.com/questions/2350/how-to-map-alt-key
execute "set <M-j>=\ej"
execute "set <M-k>=\ek"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv


def CopyWithoutNewLine()
  execute ':normal ^vg_"+y'
  var lnum = line(".")
  echomsg "Copied line " .. lnum .. " to clipboard"

  var type = prop_type_get('copied-line-highlight')
  if type == {}
    prop_type_add('copied-line-highlight', {highlight: 'Underlined'})
  endif
  prop_add(lnum, 1, {type: 'copied-line-highlight', end_col: col("$") })
  var Clear = (id) => {
    prop_clear(lnum)
  }
  timer_start(2000, Clear)
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
# nnoremap <leader>cc :close<CR>
# close current buffer
nnoremap <Leader>cc :bw %<CR>

# tabs switching
# nnoremap <Leader>t :tabs<CR>:tabnext<Space>

# buffers list
# nnoremap <Leader>bl :setlocal nomore <Bar> :ls t <Bar> :setlocal more <CR>:b<Space>
nnoremap \b :ls<CR>:b
nnoremap <silent> <leader>b :Buffers<CR>

nnoremap ]b <Plug>(buf-surf-forward)
nnoremap [b <Plug>(buf-surf-back)


# FILE -----------------------------------------------------------------------------
# Open current file with Encode
# nnoremap <Leader>ee :edit ++enc= %<left><left>
nnoremap \a :vim9cmd PathFileCopyAbsolute<CR>
nnoremap \r :vim9cmd PathFileCopyRelative<CR>
nnoremap \l :vim9cmd PathFileWithLine<CR>
nnoremap \n :vim9cmd FileCopyNameAll<CR>
nnoremap \q :vim9cmd BufferCloseOthers<CR>


# FIND FILE -----------------------------------------------------------------------------
def CreateScratch()
  enew
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
enddef
# Read from shell and move to new buffer
command -nargs=* -complete=shellcmd FilesBuffer CreateScratch() | read <args>

nnoremap <Leader>fp :vim9cmd FilesBuffer !find * -not -path "./.git/*" -iname "**"<left><left>
vnoremap <Leader>fp y:vim9cmd FilesBuffer !find * -not -path "./.git/*" -path "*<C-R>"*"<left><left>



# FZF -----------------------------------------------------------------------------
nnoremap <silent><nowait> <leader>; :Commands<CR>
# nnoremap <leader>tt :Tags '<C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>tt :CustomFzfTags <C-R>=expand("<cword>")<CR><CR>
# nnoremap <leader>tb :BTags '<C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>tb :CustomFzfBufferTagsCaseSensitive <C-R>=expand("<cword>")<CR><CR>
# nnoremap <leader>tf :BTags<CR>
nnoremap <leader>tf :CustomFzfBufferTags<CR>

nnoremap <silent><nowait> <leader>ff :CustomFzfFiles<CR>
nnoremap <silent><nowait> <leader>fc :CustomFzfFiles <C-R>=expand("%:h")<CR>/<CR>
nnoremap <expr> <leader>fu ':CustomFzfFiles<CR>' .. expand('<cword>')
xnoremap <leader>ff y:vim9cmd <SID>fzfLib.GotoSelection()<CR>
nnoremap <leader>mm :Marks<CR>



# GREP -----------------------------------------------------------------------------
noremap <Leader>gg :GrepInProjectEscape<space>
vnoremap <Leader>gg y:vim9cmd <SID>grepLib.GrepInProject(getreg('"'))<CR>

nnoremap <Leader>gd :GrepInDirectoryEscape<space>
vnoremap <Leader>gd y:vim9cmd <SID>grepLib.GrepInDirectory(getreg('"'))<CR>

nnoremap <Leader>gb :GrepInBufferEscape<space>
vnoremap <Leader>gb y:vim9cmd <SID>grepLib.GrepInBuffer(getreg('"'))<CR>

nnoremap <Leader>gi :vim9cmd <SID>grepLib.GrepInProjectInput()<CR>

# grep for regex (-P is enable PATTERNS are Perl regular expressions)
# nnoremap <Leader>gr :Dispatch grep -nroHP '' ./<left><left><left><left>
nnoremap <expr> <Leader>gr ":Dispatch grep -nroHP '' " .. expand('%')



# LANGS -----------------------------------------------------------------------------
# ctrl+^ for change keymap in INSERT mode
set keymap=ukrainian-enhanced
set iminsert=0 # Default - latin layout
set imsearch=0 # Default - latin layout in search
inoremap <C-\> <C-^>



# LAYOUT -----------------------------------------------------------------------------
# move selected to new tab
xnoremap <leader>ms y:vim9cmd <SID>layoutLib.OpenNewTabWithSelectedText()<CR>
# open buffer in new tab
nnoremap <Leader>mt :tab split<BAR>diffoff<CR>

# nnoremap <Leader>w <C-w>w
nnoremap <Leader>w <C-w>p
nnoremap <Leader>1 1<C-w>w
nnoremap <Leader>2 2<C-w>w
nnoremap <Leader>3 3<C-w>w
nnoremap <Leader>4 4<C-w>w
nnoremap <Leader>5 5<C-w>w
nnoremap <Leader>6 6<C-w>w



# QUICKFIX -----------------------------------------------------------------------------
nnoremap <silent> <leader>\ :vim9cmd <SID>quickfixLib.QuickFixToggle()<CR>



# SEARCH AND REPLACE -----------------------------------------------------------------------------
vnoremap * y:vim9cmd <SID>searchReplaceLib.EscapeSearchTextMultiLines(getreg('"'), '\n')<CR>
nnoremap <Leader>sm :SearchMultiLine<space>
nnoremap <Leader>se :SearchEscape<space>
vnoremap <Leader>se y:vim9cmd <SID>searchReplaceLib.EscapeSearchText(getreg('"'))<CR>

vnoremap <Leader>ss y/<C-R>"

nnoremap <Leader>rr :vim9cmd <SID>searchReplaceLib.ReplaceInput()<CR>
vnoremap <Leader>rr y:vim9cmd <SID>searchReplaceLib.ReplaceSelectedInput()<CR>
vnoremap <Leader>rb <Esc>:'<,'>s///gc<left><left><left><left>
nnoremap <Leader>rg :%s///gc<left><left><left><left>

nnoremap <Leader>ru viwy:vim9cmd <SID>searchReplaceLib.ReplaceSelectedInput(true)<CR>
vnoremap <Leader>rw y:vim9cmd <SID>searchReplaceLib.ReplaceSelectedInput(true)<CR>

vnoremap <Leader>rv <Esc>:'<,'>s/\<\>\C//gc<left><left><left><left><left><left><left><left>



# F keys -----------------------------------------------------------------------------
nnoremap <F3> :vim9cmd <SID>mouseLib.MouseToggle()<CR>
inoremap <F3> <ESC>:vim9cmd <SID>mouseLib.MouseToggle()<CR>
cnoremap <F3> <ESC>:vim9cmd <SID>mouseLib.MouseToggle()<CR>
nnoremap <F4> :Snippets<CR>
inoremap <F4> <ESC>:Snippets<CR>
nnoremap <F5> :vim9cmd <SID>settingLib.ReloadConfigs()<CR>
nnoremap <F6> :vim9cmd <SID>langLib.RunSpellUkToggle()<CR>
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


# Tricks
# repeat last command
nnoremap <leader><backspace> @:


# PLUGINS -----------------------------------------------------------------------------
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


# help codefmt
vnoremap <leader>= <Esc>:'<,'>FormatLines<CR>


# LINT
# nnoremap ,d :ALEGoToDefinition<CR>
# nnoremap ,r :ALEFindReferences<CR>
# nnoremap ,i :ALEGoToImplementation<CR>
# nnoremap ,t :ALEGoToTypeDefinition<CR>
# nnoremap ,h :ALEHover<CR>
nnoremap ,l :ALEPopulateLocList<CR>
nnoremap ,n :ALEPreviousWrap<CR>
nnoremap ,p :ALENextWrap<CR>
# nnoremap ,s :ALESymbolSearch<CR>

# LSP
# augroup LspGo
#   var gopls_settings = {
#     'name': 'gopls',
#     'cmd': ['gopls'],
#     'allowlist': ['go'],
#     'initialization_options': {
#       "linksInHover": false,
#       "linkTarget": "",
#     },
#   }
#   autocmd User lsp_setup call lsp#register_server(gopls_settings)
#   autocmd FileType go setlocal omnifunc=lsp#complete
#   autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
# augroup END

# augroup LspPhp
#   var phpactor_settings = {
#     'name': 'phpactor',
#     'cmd': ['phpactor', 'language-server'],
#     'allowlist': ['php'],
#   }
#   autocmd User lsp_setup call lsp#register_server(phpactor_settings)
#   autocmd FileType php setlocal omnifunc=lsp#complete
#   autocmd FileType php nnoremap <buffer> gd <plug>(lsp-definition)
# augroup END

# augroup LspSh
#   var sh_settings = {
#     'name': 'bash-language-server',
#     'cmd': ['bash-language-server', 'start'],
#     'allowlist': ['sh'],
#     "env": {
#       "SHELLCHECK_PATH": "/usr/bin/shellcheck",
#     }
#   }
#   autocmd User lsp_setup call lsp#register_server(sh_settings)
#   autocmd FileType sh setlocal omnifunc=lsp#complete
#   autocmd FileType sh nnoremap <buffer> gd <plug>(lsp-definition)
# augroup END
# nnoremap ,r <plug>(lsp-references)
# nnoremap ,i <plug>(lsp-implementation)
# nnoremap ,t <plug>(lsp-type-definition)
# nnoremap ,h <plug>(lsp-hover)
# nnoremap ,d <plug>(lsp-document-diagnostics)
# nnoremap ,n <plug>(lsp-next-error)
# nnoremap ,p <plug>(lsp-previous-error)
# nnoremap ,s <plug>(lsp-document-symbol)

# def LspStartCustom()
#   call lsp#enable()
#   echo "LSP started"
# enddef
# command LspStart :call <SID>LspStartCustom()

# def LspStopCustom()
#   call lsp#disable()
#   execute 'LspStopServer'
#   echo "LSP stopped"
# enddef
# command LspStop :call <SID>LspStopCustom()

# def LspRestartCustom()
#   call LspStopCustom()
#   call LspStartCustom()
#   echo "LSP restarted"
# enddef
# command LspRestart :call <SID>LspRestartCustom()

# nnoremap <silent> ,1 :call <SID>LspStartCustom()<CR>
# nnoremap <silent> ,2 :call <SID>LspStopCustom()<CR>
# nnoremap <silent> ,3 :call <SID>LspRestartCustom()<CR>


# DEBUGGER
# g:vdebug_keymap = {
#   "run": "<Leader><F5>",
#   "run_to_cursor": "<Leader><F9>",
#   "step_over": "<Leader><F2>",
#   "step_into": "<Leader><F3>",
#   "step_out": "<Leader><F4>",
#   "close": "<Leader><F6>",
#   "detach": "<Leader><F7>",
#   "set_breakpoint": "<Leader><F10>",
#   "get_context": "<Leader><F11>",
#   "eval_under_cursor": "<Leader><F12>",
#   "eval_visual": "<Leader>e",
# }

