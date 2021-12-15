set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set backspace=indent,eol,start

command! IndentationToSpaceConvert :setlocal expandtab|retab
command! IndentationToTabsConvert :setlocal noexpandtab|%retab!
command! IndentUsingSpace :setlocal expandtab
command! IndentUsingTab :setlocal expandtab!
command! EditorShowTabSize :echo &tabstop
command! EditorLastLineEndsNewLineToggle :setlocal nofixendofline!
