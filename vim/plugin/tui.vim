vim9script

# Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

# set number
set signcolumn=number
# set numberwidth=6
set cursorline
# nnoremap <Leader>1 :setlocal number!<CR>



if (has("termguicolors"))
  set termguicolors
endif
# colorscheme lightsimple
# colorscheme darksimple

g:gruvbox_improved_warnings = 1
g:gruvbox_invert_selection = 0
g:gruvbox_italic = 0
g:gruvbox_underline = 1
g:gruvbox_contrast_light = "hard"
g:gruvbox_contrast_dark = "hard"
g:gruvbox_guisp_fallback = "bg" # fix spell colors
# set background=light
set background=dark
colorscheme gruvbox



# g:jellybeans_background_color = '151515'
# g:jellybeans_background_color = '1E1E1E'
# g:jellybeans_overrides = {
#   'Special': { 'guifg': 'CC8BC9', 'ctermfg': 'DarkPurple' },
#   'CursorLine': { 'guibg': '262626', 'ctermbg': 'DarkGrey' },
#   'CursorColumn': { 'guibg': '262626', 'ctermbg': 'DarkGrey' },
# }
# g:jellybeans_use_term_italics = 0
# g:jellybeans_use_gui_italics = 0
# colorscheme jellybeans

# # fix internal terminal colors scheme - jellybeans
# if get(g:, 'colors_name', 'default') == "jellybeans"
#   g:terminal_ansi_colors = repeat([0], 16)

#   g:terminal_ansi_colors[0] = "#414141"
#   g:terminal_ansi_colors[8] = "#BDBDBD"

#   g:terminal_ansi_colors[1] = "#E87174"
#   g:terminal_ansi_colors[9] = "#FFA0A2"

#   g:terminal_ansi_colors[2] = "#93B97E"
#   g:terminal_ansi_colors[10] = "#B8BB26"

#   g:terminal_ansi_colors[3] = "#FFB981"
#   g:terminal_ansi_colors[11] = "#FFDBA5"

#   g:terminal_ansi_colors[4] = "#648699"
#   g:terminal_ansi_colors[12] = "#ABD9F3"

#   g:terminal_ansi_colors[5] = "#E1C0F6"
#   g:terminal_ansi_colors[13] = "#FBDAFC"

#   g:terminal_ansi_colors[6] = "#00988E"
#   g:terminal_ansi_colors[14] = "#00B3A8"

#   g:terminal_ansi_colors[7] = "#DEDEDE"
#   g:terminal_ansi_colors[15] = "#FEFEFE"
# endif


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

# cursor shape in difference mode
&t_SI = "\<esc>[6 q"
&t_SR = "\<esc>[3 q"
&t_EI = "\<esc>[2 q"



set laststatus=2

def g:StatuslineExpr(): string
  var file_path = "%f "
  var modified = "%{&modified ? '[+] ' : ''}"
  var readonly  = "%{&readonly ? '[RO] ' : ''}"
  var separate = " %= "
  var win_nr = "[%{winnr()}] "
  # var fugitive = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  # var ftype  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  # var fencoding  = "%{&fileencoding ? '['.&fileencoding.'] ' : '['.&encoding.'] '}"
  var position = " %l:%c "
  var percent = " %P"

  return file_path .. modified .. readonly .. separate .. win_nr  .. position .. percent
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
