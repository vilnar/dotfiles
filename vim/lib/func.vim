vim9script

export def GetVisualSelection(mode: string): string
    var lines = getregion(getpos("'<"), getpos("'>"), { type: mode })
    return join(lines, "\n")
enddef
