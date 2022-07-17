vim9script

command WhiteSpaceTrailSearch /\s\+$

def WhiteSpaceTrailClearInRange(firstline: number, lastline: number)
  execute ":" .. firstline .. "," .. lastline .. "s/\\s\\+$//e"
enddef
command -range WhiteSpaceTrailClear call WhiteSpaceTrailClearInRange(<line1>, <line2>)
