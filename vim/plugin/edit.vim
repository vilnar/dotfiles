set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

command! IndentationToSpaceConvert :setlocal expandtab|retab
command! IndentationToTabsConvert :setlocal noexpandtab|%retab!
command! IndentUsingSpace :setlocal expandtab
command! IndentUsingTab :setlocal expandtab!
