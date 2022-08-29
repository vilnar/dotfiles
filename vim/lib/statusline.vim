vim9script

def GetIndtentation(): string
  var mess = "T:" # tabs
  if &expandtab == true
    mess = "S:" # spaces
  endif
  return mess .. shiftwidth()
enddef

export def StatuslineExpr(): string
  var file_path = "%f "

  var modified = ''
  if &modified
    modified = '[+] '
  endif

  var readonly = ''
  if &readonly
    readonly = '[RO] '
  endif

  var separate = " %= "
  var win_nr = "[%{winnr()}] "

  var ftype  = ''
  if !empty(&filetype)
    ftype = '[' .. &filetype .. '] '
  endif

  var indentaition = GetIndtentation() .. " "
  var position = " %l:%c "
  var percent = " %P"

  return file_path .. modified .. readonly .. separate .. win_nr  .. indentaition .. ftype .. position .. percent
enddef
