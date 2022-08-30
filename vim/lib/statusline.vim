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

  return file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent
enddef
