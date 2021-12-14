if !executable('pandoc')
  " echoerr 'pandoc not installed!'
  finish
endif

function s:GetName()
  return winnr() . '-' . bufnr()
endfunction

function s:GetMarkdownTmpPath()
  return '/tmp/' . s:GetName() . '.md'
endfunction

function s:GetHtmlTmpPath()
  return '/tmp/' . s:GetName() . '.html'
endfunction

function s:MarkdownToHtml()
  execute ':w!'
  execute ':w! ' . s:GetMarkdownTmpPath()
  execute 'Dispatch pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' . s:GetHtmlTmpPath() . ' ' . s:GetMarkdownTmpPath()
endfunction

function s:MarkdownPreviewRun()
  call s:MarkdownToHtml()
  execute 'Dispatch firefox ' . s:GetHtmlTmpPath() . ' > /dev/null 2> /dev/null&'
endfunction
command! MarkdownPreview call s:MarkdownPreviewRun()

augroup MarkdownPreviewListener
  autocmd!
  autocmd BufWritePre <buffer> call s:MarkdownToHtml()
augroup END
