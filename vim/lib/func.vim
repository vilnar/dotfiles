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




def JobHandler(channel: channel, msg: string)
    if !empty(msg)
        setqflist([], 'a', {lines: [msg]})
    endif
enddef

def ExitHandler(job: job, status: number)
    if status == 0
        echomsg "Dispatch completed successfully."
    else
        echomsg "Dispatch failed with status " .. status
    endif
enddef

def Dispatch(args: string)
    var cmd = !empty(args) ? args : &makeprg
    cmd = substitute(cmd, '\s\+\$\*', '', 'g')

    if empty(cmd)
        echoerr "No command provided and 'makeprg' is empty!"
        return
    endif

    # clear quickfix
    setqflist([], 'r', {title: cmd, items: []})

    # add title to quickfix
    setqflist([{text: '# ' .. cmd}], 'a')

    # open quickfix
    copen

    var options = {
        out_mode: 'nl',
        err_mode: 'nl',
        out_cb: JobHandler,
        err_cb: JobHandler,
        exit_cb: ExitHandler,
    }

    echomsg "Dispatching: " .. cmd
    job_start(['sh', '-c', cmd], options)
enddef

command! -nargs=* -complete=shellcmd Dispatch Dispatch(<q-args>)




def StartCommand(args: string, bang: bool)
    var cmd = !empty(args) ? args : &makeprg
    cmd = substitute(cmd, '\s\+\$\*', '', 'g')

    if empty(cmd)
        echoerr "No command provided and 'makeprg' is empty!"
        return
    endif


    var current_win_id = win_getid()

    var options = {
        term_name: 'Start: ' .. cmd,
        curwin: 0,
        norestore: 1,
    }

    var term_buf = term_start(['sh', '-c', cmd], options)

    if bang
        win_gotoid(current_win_id)
        echomsg "Started in background: " .. cmd
    endif
enddef

command! -nargs=* -bang -complete=shellcmd Start StartCommand(<q-args>, !empty('<bang>'))

