vim9script

def RunMyTags(query: string)
  var spec = {"options": ["--preview-window", "down", "--nth", "1,2,3", "-i"], "placeholder": "--tag {2}:{-1}:{3..}"}
  call fzf#vim#tags(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=* MyTags call RunMyTags(<q-args>)

def RunMyBufferTags(query: string, is_case_sensitive: bool)
  var spec = {"options": ["--preview-window", "down", "--nth", "1,2"], "placeholder": "{2}:{3..}"}
  if is_case_sensitive
    spec = {"options": ["--preview-window", "down", "--nth", "1,2", "+i"], "placeholder": "{2}:{3..}"}
  endif
  call fzf#vim#buffer_tags(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=* MyBufferTagsCaseSensitive call RunMyBufferTags(<q-args>, true)
command -bang -nargs=* MyBufferTags call RunMyBufferTags(<q-args>, false)


def RunMyFiles(query: string)
  # hide preview window
  var spec = {"options": ['--preview-window', 'hidden']}
  call fzf#vim#files(query, fzf#vim#with_preview(spec), 0)
enddef
command -bang -nargs=? -complete=dir MyFiles call RunMyFiles(<q-args>)

# https://github.com/sharkdp/fd
$FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --exclude .git --no-ignore'
# $FZF_DEFAULT_COMMAND = 'rg -uuu --files'

def GotoSelection()
  var text = getreg('"')
  # replace for php namespaces
  text = substitute(text, '\', '/', 'g')
  exec ":MyFiles"
  feedkeys(text)
enddef
