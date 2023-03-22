vim9script

# source: https://stackoverflow.com/a/61486601
export def GetVisualSelection(mode: string): string
    # call with visualmode() as the argument
    var [line_start, column_start] = getpos("'<")[1 : 2]
    var [line_end, column_end]     = getpos("'>")[1 : 2]
    var lines = getline(line_start, line_end)
    if mode ==# 'v'
        # Must trim the end before the start, the beginning will shift left.
        lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
        lines[0] = lines[0][column_start - 1 :]
    elseif  mode ==# 'V'
        # Line mode no need to trim start or end
    elseif  mode == "\<c-v>"
        # Block mode, trim every line
        var new_lines = []
        var i = 0
        for line in lines
            lines[i] = line[column_start - 1 : column_end - (&selection == 'inclusive' ? 1 : 2)]
            i = i + 1
        endfor
    else
        return ""
    endif
    # for line in lines
    #     echom line
    # endfor
    return join(lines, "\n")
enddef
