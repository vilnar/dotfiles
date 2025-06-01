vim9script

export def GetVisualSelection(mode: string): string
    var lines = getregion(getpos("'<"), getpos("'>"), { type: mode })
    return join(lines, "\n")
enddef

export def GetVisualSelectionForCLI(mode: string): string
    var lines = getregion(getpos("'<"), getpos("'>"), { type: mode })
    var text = join(lines, "\\n")
    text = substitute(text, '\"', '\\"', 'g')
    text = substitute(text, '\t', " ", 'g')
    return text
enddef
