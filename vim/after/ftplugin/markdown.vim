vim9script

# setlocal spell! spelllang=uk,en_us
# setlocal wrap

# g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sh', 'sql']
g:markdown_fenced_languages = []


if !executable('pandoc')
  # echoerr 'pandoc not installed!'
  finish
endif

def DirSeparator(): string
  if has("win32")
    return "\\"
  endif
  return "/"
enddef

def BrowserPath(): string
  if has("win32")
    # WARNING: need option set shellxescape="\"&|<>()@^"
    return "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
  endif
  return "google-chrome"
enddef

def GetName(): string
  return printf("%s-%s-%s", expand("%:t:r"), buffer_number(), getpid())
enddef

def GetMarkdownTmpPath(): string
  return $TEMP .. DirSeparator() .. GetName() .. '.md'
enddef

def GetHtmlTmpPath(): string
  return $TEMP .. DirSeparator() .. GetName() .. '.html'
enddef

def GenerateHtml()
  execute ':w!'
  execute ':w! ' .. GetMarkdownTmpPath()
  execute 'Dispatch! pandoc -s --metadata pagetitle="temp markdown" -f markdown -t html -o ' .. GetHtmlTmpPath() .. ' ' .. GetMarkdownTmpPath()
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
  execute 'sleep 2'
  var path = GetHtmlTmpPath()
  if !filereadable(path)
    echoerr printf("Not generated html %s", path)
    return
  endif
  execute 'Dispatch "' .. BrowserPath() .. '" ' .. path
enddef
command! MarkdownPreview RunPreview()

def ClearGeneratedFiles()
  if has("win32")
    execute 'Dispatch! del /f ' .. GetMarkdownTmpPath() .. ' ' .. GetHtmlTmpPath()
  endif
  execute 'Dispatch! rm -f ' .. GetMarkdownTmpPath() .. ' ' .. GetHtmlTmpPath()
enddef
command! MarkdownPreviewClear ClearGeneratedFiles()

augroup MarkdownPreviewListener
  autocmd BufWritePre <buffer> {
    GenerateHtmlWithCheckRunPreview()
  }
augroup END
