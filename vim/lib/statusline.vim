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


  # BUG: when split window, and changes modes, non active split status line color isn't correct
  # var color = ""
  # var m = mode()
  # if m == "i" || m == "R"
  #   color = "%#InsertColor#"
  #   if &iminsert
  #     color = "%#ImInsertColor#"
  #   endif
  # endif
  # return color .. file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent

  return file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent
enddef
