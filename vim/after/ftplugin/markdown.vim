if !executable('pandoc')
  finish
endif

let s:html_tmp = "/tmp/vim-markdown.html"
let s:md_tmp = "/tmp/vim-markdown.md"

function s:MarkdownToHtml()
  execute ':w!'
  execute ':w! ' . s:md_tmp
  execute 'AsyncRun -silent pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' . s:html_tmp . ' ' . s:md_tmp
  echomsg 'INFO: Markdown compiled in html!'
endfunction

function s:MarkdownPreviewRun()
  call s:MarkdownToHtml()
  execute '!firefox ' . s:html_tmp . ' > /dev/null 2> /dev/null&'
endfunction
command! MarkdownPreview call s:MarkdownPreviewRun()

augroup MarkdownPreviewListener
  autocmd!
  autocmd BufWritePre <buffer> call s:MarkdownToHtml()
augroup END
