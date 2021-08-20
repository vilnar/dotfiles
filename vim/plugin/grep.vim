" grep
nnoremap <Leader>gg :AsyncRun grep -rni --exclude-dir=".git" -e '' ./<left><left><left><left>
nnoremap <expr> <Leader>gd ":AsyncRun grep -rni --exclude-dir='.git' -e '' " .  expand('%:h')
nnoremap <expr> <Leader>gc ":AsyncRun grep -rni --exclude-dir='.git' -e '' " .  expand('%')

vnoremap <Leader>gg y:AsyncRun grep -rni --exclude-dir=".git" -e '<C-R>"' ./
vnoremap <expr> <Leader>gd "y:AsyncRun grep -rni --exclude-dir='.git' -e '<C-R>\"' " .  expand('%:h')
vnoremap <expr> <Leader>gc "y:AsyncRun grep -rni --exclude-dir='.git' -e '<C-R>\"' " .  expand('%')