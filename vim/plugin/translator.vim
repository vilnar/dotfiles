vim9script

import "../lib/func.vim" as funcLib


g:translator_buffer_id = 0

def RunTranslate(target: string)
  if g:translator_buffer_id > 0
    execute 'bwipeout ' .. g:translator_buffer_id
  endif

  var text = funcLib.GetVisualSelectionForCLI(visualmode())
  # echomsg printf("debug command\\n%s\\n", command)
  # var output = system(command)

  # run async job and move output to buffer
  var command = printf('translator -text="%s" -to="%s"', text, target)
  var job = job_start(command, {'out_io': 'buffer', 'out_name': 'translator'})

  split | buffer translator
  g:translator_buffer_id = bufnr()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  # go to prev window
  feedkeys("\<C-w>p")
enddef


vnoremap <Leader>t1 :<C-U> vim9cmd <SID>RunTranslate('uk')<CR>
vnoremap <Leader>t2 :<C-U> vim9cmd <SID>RunTranslate('en')<CR>
