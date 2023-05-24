vim9script

export def StatuslineExpr(): string
  var file_path = "%f "
  var modified = "%{&modified ? '[+] ' : ''}"
  var readonly  = "%{&readonly ? '[RO] ' : ''}"
  var separate = " %= "
  var win_nr = "[%{winnr()}] "
  var indentaition = "%{&expandtab ? 'S:' .. shiftwidth() : 'T:' .. shiftwidth()}"
  var ftype  = "%{empty(&filetype) ? '' : '  [' .. &filetype .. '] '}"
  var position = " %l:%c "
  var percent = " %P"


  var lang = "%{&iminsert ? ' UK ' : ''}"
  var color = ""
  var m = mode()
  # source: https://github.com/lacygoill/vim-statusline/blob/f45aa31670be3285633c09861bf7f9836731fa5e/plugin/statusline.vim#L437-L448
  var is_active = g:statusline_winid == win_getid()
  if is_active && (m == "i" || m == "R")
    color = "%#InsertColor#"
    if &iminsert
      color = "%#ImInsertColor#"
    endif
  endif
  const visual_modes = ["v", "vs", "V", "Vs"]
  if is_active && index(visual_modes, m) >= 0
    color = "%#VisualColor#"
  endif
  # echomsg printf("debug %s", color)
  return color .. file_path .. modified .. readonly .. separate .. lang .. win_nr  .. indentaition .. ftype .. position .. percent
enddef


set laststatus=2

var StatusRef = StatuslineExpr
&statusline = '%!' .. expand('<SID>') .. 'StatusRef()'
