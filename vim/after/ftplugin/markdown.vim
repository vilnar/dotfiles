if !executable('pandoc')
  finish
endif
function s:MarkdownPreviewRun()
  let md_tmp = "/tmp/vim-markdown.md"
  let html_tmp = "/tmp/vim-markdown.html"
  execute ':w!'
  execute ':w! ' . md_tmp
  execute 'AsyncRun pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' . html_tmp . ' ' . md_tmp . ' && firefox ' . html_tmp . ' > /dev/null 2> /dev/null&'
  " execute 'AsyncRun markdown ' . md_tmp . ' -> ' . html_tmp . ' && firefox ' . html_tmp . ' > /dev/null 2> /dev/null&'
endfunction
command! MarkdownPreview call s:MarkdownPreviewRun()
