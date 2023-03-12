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
  return color .. file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent

  # return file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent
enddef
