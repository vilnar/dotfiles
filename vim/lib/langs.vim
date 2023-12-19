vim9script

# help spell
# `z=` - Finding suggestions for bad words
def RunSpellEnToggle()
  execute 'setlocal spell! spelllang=en_us,uk'
  if &spell
    echomsg "EN spelling is enabled"
  else
    echomsg "Spelling disabled"
  endif
enddef
command SpellEnToggle RunSpellEnToggle()

def RunSpellUkToggle()
  execute 'setlocal spell! spelllang=uk,en_us'
  if &spell
    echomsg "UK spelling is enabled"
  else
    echomsg "Spelling disabled"
  endif
enddef
command SpellUkToggle RunSpellUkToggle()

set langmenu=en_US
$LANG = 'en_US'
