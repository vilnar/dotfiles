vim9script

import "../lib/func.vim" as funcLib


g:translator_buffer_id = 0

def RunTranslate()
  var text = funcLib.GetVisualSelectionForCLI(visualmode())
  var command = printf('translator -text="%s"', text)
  # echomsg printf("debug command\\n%s\\n", command)
  var output = system(command)

  if g:translator_buffer_id > 0
    execute 'bwipeout ' .. g:translator_buffer_id
  endif

  execute ':new [translator]'
  g:translator_buffer_id = bufnr()
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  append(0, split(output, '\n'))
enddef


vnoremap <Leader>tt :<C-U> vim9cmd <SID>RunTranslate()<CR>
