if !executable('pandoc')
  " echoerr 'pandoc not installed!'
  finish
endif

function s:GetName()
  return expand("%:t:r")
endfunction

function s:GetMarkdownTmpPath()
  return '/tmp/' . s:GetName() . '.md'
endfunction

function s:GetHtmlTmpPath()
  return '/tmp/' . s:GetName() . '.html'
endfunction

function s:GenerateHtml()
  execute ':w!'
  execute ':w! ' . s:GetMarkdownTmpPath()
  execute 'Dispatch pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' . s:GetHtmlTmpPath() . ' ' . s:GetMarkdownTmpPath()
endfunction

function s:GenerateHtmlWithCheckRunPreview()
  let path = s:GetHtmlTmpPath()
  if !filereadable(path)
    " html file was not generated, which means command MarkdownPreview was not run
    " TODO: maybe it would be better to check if browser still opened and reopen it if needed
    return
  endif
  call s:GenerateHtml()
endfunction

function s:RunPreview()
  call s:GenerateHtml()
  execute 'Dispatch firefox ' . s:GetHtmlTmpPath() . ' > /dev/null 2> /dev/null&'
endfunction
command! MarkdownPreview call s:RunPreview()

function s:ClearGeneratedFiles()
  execute 'Dispatch rm -f ' . s:GetMarkdownTmpPath() . ' ' . s:GetHtmlTmpPath()
endfunction
command! MarkdownPreviewClear call s:ClearGeneratedFiles()

augroup MarkdownPreviewListener
  autocmd!
  autocmd BufWritePre <buffer> call s:GenerateHtmlWithCheckRunPreview()
augroup END
