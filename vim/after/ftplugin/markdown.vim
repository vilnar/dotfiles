vim9script

# setlocal wrap

if !executable('pandoc')
  # echoerr 'pandoc not installed!'
  finish
endif

def GetName(): string
  return printf("%s-%s-%s", expand("%:t:r"), buffer_number(), getpid())
enddef

def GetMarkdownTmpPath(): string
  return '/tmp/' .. GetName() .. '.md'
enddef

def GetHtmlTmpPath(): string
  return '/tmp/' .. GetName() .. '.html'
enddef

def GenerateHtml()
  execute ':w!'
  execute ':w! ' .. GetMarkdownTmpPath()
  execute 'Start! pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' .. GetHtmlTmpPath() .. ' ' .. GetMarkdownTmpPath()
  # execute 'AsyncRun -pos=hide pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' .. GetHtmlTmpPath() .. ' ' .. GetMarkdownTmpPath()
enddef

def GenerateHtmlWithCheckRunPreview()
  var path = GetHtmlTmpPath()
  if !filereadable(path)
    # html file was not generated, which means command MarkdownPreview was not run
    # TODO: maybe it would be better to check if browser still opened and reopen it if needed
    return
  endif
  GenerateHtml()
enddef

def RunPreview()
  GenerateHtml()
  # wait generate html
  execute 'sleep 1'
  var path = GetHtmlTmpPath()
  if !filereadable(path)
    echoerr printf("Not generated html %s", path)
    return
  endif
  execute 'Start! google-chrome ' .. path
enddef
command MarkdownPreview RunPreview()

def ClearGeneratedFiles()
  execute 'Start! rm -f ' .. GetMarkdownTmpPath() .. ' ' .. GetHtmlTmpPath()
enddef
command MarkdownPreviewClear ClearGeneratedFiles()

augroup MarkdownPreviewListener
  autocmd BufWritePre <buffer> {
    GenerateHtmlWithCheckRunPreview()
  }
augroup END
