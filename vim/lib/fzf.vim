vim9script

import "./func.vim" as funcLib


def RunCustomFzfTags(query: string)
  var spec = {"options": ["--preview-window", "down", "--nth", "1,2,3", "-i"], "placeholder": "--tag {2}:{-1}:{3..}"}
  call fzf#vim#tags(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=* CustomFzfTags call RunCustomFzfTags(<q-args>)

def RunCustomFzfBufferTags(query: string, is_case_sensitive: bool)
  var spec = {"options": ["--preview-window", "down", "--nth", "1,2"], "placeholder": "{2}:{3..}"}
  if is_case_sensitive
    spec = {"options": ["--preview-window", "down", "--nth", "1,2", "+i"], "placeholder": "{2}:{3..}"}
  endif
  call fzf#vim#buffer_tags(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=* CustomFzfBufferTagsCaseSensitive call RunCustomFzfBufferTags(<q-args>, true)
command -bang -nargs=* CustomFzfBufferTags call RunCustomFzfBufferTags(<q-args>, false)


def RunCustomFzfFiles(query: string)
  # var window = 'hidden'
  var window = '+{2}-/2'
  # var window = 'down'
  var spec = {"options": ['--preview-window', window]}
  call fzf#vim#files(query, fzf#vim#with_preview(spec), 0)
enddef
command! -bang -nargs=? -complete=dir CustomFzfFiles call RunCustomFzfFiles(<q-args>)

# https://github.com/sharkdp/fd
# $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --exclude .git --no-ignore'
# $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --exclude .git --no-ignore'
# $FZF_DEFAULT_COMMAND = 'rg -uuu --files -g "!.git/"'

def GotoSelectionFzf()
  # var text = getreg('"')
  var text = funcLib.GetVisualSelection(visualmode())
  # replace for php namespaces
  text = substitute(text, '\', '/', 'g')
  exec ":CustomFzfFiles"
  feedkeys(text)
enddef

def GotoSelection()
  # var text = getreg('"')
  var text = funcLib.GetVisualSelection(visualmode())
  # replace for php namespaces
  text = substitute(text, '\', '/', 'g')
  # exec ":CustomFzfFiles"
  # feedkeys(text)
  feedkeys(":find **/*" .. text)
enddef

