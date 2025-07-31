vim9script

# set formatoptions=qjl
augroup CustomFormatOption
  autocmd FileType * {
    setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  }
augroup END

command IndentConvertToSpace :setlocal expandtab|retab
command IndentConvertToTabs :setlocal noexpandtab|%retab!
command IndentUse4Spaces :set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
command IndentUse2Spaces :setlocal tabstop=8 softtabstop=2 shiftwidth=2 expandtab
command IndentUse8Tab :setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
command EditorShowTabSize :echo &tabstop
command EditorLastLineEndsNewLineToggle :setlocal nofixendofline!
command EditorShowLineEncoding :echo &fileformat
command EditorShowType :echo &filetype


command EncodeDetectThis :!chardet %
command EncodingSupportedShow :help encoding-values
command EncodingShow :echo exists(&fileencoding) ? &fileencoding : &encoding
command CdToFile :execute 'cd ' .. expand('%:p:h')
