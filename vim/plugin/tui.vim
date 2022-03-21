vim9script

# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# set number
set signcolumn=number
# set numberwidth=6

set cursorline
augroup MyCursorLine
  autocmd OptionSet diff {
    if &diff
      &cursorline = 0
      &list = 1
    else
      &cursorline = 1 
      &list = 0
    endif
  }
augroup end


if (has("termguicolors"))
  set termguicolors
endif
# colorscheme lightsimple
# colorscheme darksimple


augroup MyColors
  autocmd ColorScheme gruvbox {
    highlight Ignore ctermbg=NONE ctermfg=245 cterm=NONE guibg=NONE guifg=#928374 gui=NONE
    highlight Function ctermbg=NONE ctermfg=172 cterm=bold guibg=NONE guifg=#d79921 gui=bold
    highlight CursorLine ctermbg=DarkGrey ctermfg=NONE cterm=NONE guibg=#32302f guifg=NONE gui=NONE
  }
augroup end

g:gruvbox_invert_selection = 0
g:gruvbox_italic = 0
g:gruvbox_underline = 1
g:gruvbox_contrast_light = "hard"
g:gruvbox_contrast_dark = "hard"
g:gruvbox_guisp_fallback = "bg" # fix spell colors
g:gruvbox_vert_split = "bg1"
g:gruvbox_hls_highlight = "purple"
# # set background=light
set background=dark
colorscheme gruvbox


# g:jellybeans_background_color = '151515' # default
# g:jellybeans_background_color = '1E1E1E'
# g:jellybeans_overrides = {
#   'Special': { 'guifg': 'CC8BC9', 'ctermfg': 'DarkPurple' },
#   'CursorLine': { 'guibg': '262626', 'ctermbg': 'DarkGrey' },
#   'CursorColumn': { 'guibg': '262626', 'ctermbg': 'DarkGrey' },
#   'markdownCode': { 'guifg': '99ad6a', 'ctermfg': 'Green' },
#   'markdownCodeBlock': { 'guifg': '99ad6a', 'ctermfg': 'Green' },
#   'Ignore': { 'guifg': '888888', 'ctermfg': 'Grey' },
# }
# g:jellybeans_use_term_italics = 0
# g:jellybeans_use_gui_italics = 0
# colorscheme jellybeans
# # fix internal terminal colors scheme - jellybeans
# if get(g:, 'colors_name', 'default') == "jellybeans"
#   g:terminal_ansi_colors = [
#         '#414141', # 0    black
#         '#E87174', # 1    dark red
#         '#93B97E', # 2    dark green
#         '#FFB981', # 3    brown
#         '#648699', # 4    dark blue
#         '#E1C0F6', # 5    dark magenta
#         '#FBDAFC', # 6    dark cyan
#         '#00988E', # 7    light grey
#         '#DEDEDE', # 8    dark grey
#         '#BDBDBD', # 9    red
#         '#FFA0A2', # 10   green
#         '#B8BB26', # 11   yellow
#         '#FFDBA5', # 12   blue
#         '#ABD9F3', # 13   magenta
#         '#00B3A8', # 14   cyan
#         '#FEFEFE', # 15   white
#   ]
# endif


# set linebreak
set showbreak=->
set nowrap
noremap <F8> :set wrap!<CR>

set history=1000
set wildmenu wildmode=full
set wildignorecase
set wildoptions=pum pumheight=20
set shortmess-=S
set showcmd
# set complete=.,b,u,t 
# set complete=.,t 
set complete=. 

set splitbelow
set title

set hidden
set confirm

set nomore

set display+=lastline

if !has('gui_running')
  # cursor shape in difference mode
  &t_SI = "\<esc>[6 q"
  &t_SR = "\<esc>[3 q"
  &t_EI = "\<esc>[2 q"
endif



set laststatus=2

def g:StatuslineExpr(): string
  var file_path = "%f "
  var modified = "%{&modified ? '[+] ' : ''}"
  var readonly  = "%{&readonly ? '[RO] ' : ''}"
  var separate = " %= "
  var win_nr = "[%{winnr()}] "
  # var fugitive = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  # var fencoding  = "%{&fileencoding ? '['.&fileencoding.'] ' : '['.&encoding.'] '}"
  var ftype  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  var position = " %l:%c "
  var percent = " %P"

  return file_path .. modified .. readonly .. separate .. win_nr  .. ftype .. position .. percent
enddef
set statusline=%!StatuslineExpr()

# nnoremap <Leader>w <C-w>w
nnoremap <Leader>w <C-w>p
nnoremap <Leader>1 1<C-w>w
nnoremap <Leader>2 2<C-w>w
nnoremap <Leader>3 3<C-w>w
nnoremap <Leader>4 4<C-w>w
nnoremap <Leader>5 5<C-w>w
nnoremap <Leader>6 6<C-w>w
