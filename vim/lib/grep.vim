vim9script

import "./func.vim" as funcLib


def GetRelativePathForGrep(): string
  var path = expand('%:h')
  if path == '.'
    return './'
  endif
  var rel_path_match = match(path, "^\./")
  var abs_path_match = match(path, "^\/")
  if rel_path_match != -1 || abs_path_match != -1
    return path
  endif
  var result = './' .. path .. '/'
  if has('win32')
    result = path
  endif
  return result
enddef

def SearchInOpenedBuffers(pattern: string)
  execute 'cclose'
  execute 'cexpr []'
  execute 'bufdo vimgrepadd /' .. pattern .. '/g %'
  execute 'cwindow'
enddef
command -nargs=1 SearchInOpenedBuffers SearchInOpenedBuffers(<f-args>)


const ESCAPE_CHARS = '\- \* \$ \[ \] \.'

def EscapeText(text: string): string
  var text_esc = escape(text, ESCAPE_CHARS)
  return shellescape(text_esc, 1)
enddef


def GrepWithEscaped(text: string, template: string)
  var text_esc = EscapeText(text)
  var scom =  printf(template, text_esc)
  histadd('cmd', scom)
  exec scom
enddef


def GrepInProjectVisual()
  var text = funcLib.GetVisualSelection(visualmode())
  call GrepInProject(text)
enddef

def GrepInProject(text: string)
  # var template = 'Dispatch grep -rIni --exclude="tags" --exclude-dir=".git" %s ./'
  var template = 'Dispatch rg --vimgrep --smart-case --glob="!.git" %s ./'
  call GrepWithEscaped(text, template)
enddef
command -nargs=1 GrepInProjectEscape :vim9cmd GrepInProject(<q-args>) | normal! n


def GrepInDirectoryVisual()
  var text = funcLib.GetVisualSelection(visualmode())
  call GrepInDirectory(text)
enddef

def GrepInDirectory(text: string)
  # var template = 'Dispatch grep -rIni --exclude="tags" --exclude-dir=".git" %s ' .. GetRelativePathForGrep()
  var template = 'Dispatch rg --vimgrep --smart-case --glob="!.git" %s ' .. GetRelativePathForGrep()
  call GrepWithEscaped(text, template)
enddef
command -nargs=1 GrepInDirectoryEscape :vim9cmd GrepInDirectory(<q-args>) | normal! n


def GrepInBufferVisual()
  var text = funcLib.GetVisualSelection(visualmode())
  call GrepInBuffer(text)
enddef

def GrepInBuffer(text: string)
  # var template = 'Dispatch grep -nirH %s ' .. expand('%')
  var template = 'Dispatch rg --vimgrep --smart-case  %s ' .. GetRelativePathForGrep()
  call GrepWithEscaped(text, template)
enddef
command -nargs=1 GrepInBufferEscape :vim9cmd GrepInBuffer(<q-args>) | normal! n


def GrepInProjectInput()
  var text = input('Query: ', '')
  if text == ''
    echoerr "empty text"
    return
  endif
  var file_type = input('File type: ')
  if file_type == ''
    echoerr "empty file type"
    return
  endif
  # var template = 'Dispatch grep -rn --include=*.%s %s ./'
  var template = 'Dispatch rg --vimgrep --smart-case --type=%s %s ./'
  var text_esc = EscapeText(text)
  var scom = printf(template, file_type, text_esc)
  histadd('cmd', scom)
  exec scom
enddef
