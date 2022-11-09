vim9script

# editor macros
# in command mode <C-R>{register}

# clear file and save
@c = ':1VGd:w'

# Do not redraw screen in the middle of a macro. Makes them complete faster.
# It is only meant to be set temporarily when performing an operation where redrawing may cause flickering or cause a slow down.
# set lazyredraw
