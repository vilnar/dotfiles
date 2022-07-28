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
