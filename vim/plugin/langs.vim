vim9script

# help spell
# `z=` - Finding suggestions for bad words
def RunSpellEnToggle()
  execute 'setlocal spell! spelllang=en_us'
  echomsg "Toggle spell EN"
enddef
command SpellEnToggle RunSpellEnToggle()

def RunSpellUkToggle()
  execute 'setlocal spell! spelllang=uk'
  echomsg "Toggle spell UK"
enddef
command SpellUkToggle RunSpellUkToggle()
nnoremap <F4> :vim9cmd <SID>RunSpellUkToggle()<CR>



# ctrl+^ for change keymap in INSERT mode
set keymap=ukrainian-enhanced
set iminsert=0 # Default - latin layout
set imsearch=0 # Default - latin layout in sea
inoremap <C-\> <C-^>
