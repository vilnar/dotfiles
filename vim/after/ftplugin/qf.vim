vim9script

import "../../lib/statusline.vim" as statusline

setlocal nonumber

var StatusRef = statusline.StatuslineExpr
&statusline = '%!' .. expand('<SID>') .. 'StatusRef()'
