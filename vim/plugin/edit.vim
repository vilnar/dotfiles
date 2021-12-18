vim9script

set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set backspace=indent,eol,start

command IndentationConvertToSpace :setlocal expandtab|retab
command IndentationConvertToTabs :setlocal noexpandtab|%retab!
command IndentUseSpace :setlocal expandtab
command IndentUseTab :setlocal expandtab!
command EditorShowTabSize :echo &tabstop
command EditorLastLineEndsNewLineToggle :setlocal nofixendofline!
