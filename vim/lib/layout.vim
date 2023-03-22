vim9script

import "./func.vim" as funcLib


def OpenNewTabWithSelectedText()
  var text = funcLib.GetVisualSelection(visualmode())
  execute ':tabnew'
  append(0, split(text, '\n'))
enddef
