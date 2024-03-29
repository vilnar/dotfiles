vim9script

if !exists("g:ReloadConfigs")
  def g:ReloadConfigs()
    var is_empty_buffer = line('$') == 1 && getline(1) == ''
    var is_empty_bufname = bufname() == ''
    if !is_empty_buffer && !is_empty_bufname && &modifiable
      execute 'write'
    endif
    execute 'source ~/.vim/vimrc'
    execute 'source ~/.vim/lib/custom.vim'
    execute 'source ~/.vim/plugin/macros.vim'
    execute 'source ~/.vim/plugin/options.vim'
    execute 'source ~/.vim/plugin/test.vim'
    execute 'source ~/.vim/plugin/tui.vim'
    if has("gui_running")
      execute 'source ~/.vim/gvimrc'
    endif
    execute 'source ~/.vim/plugin/mappings.vim'
    if !is_empty_buffer && !is_empty_bufname
      execute 'edit'
    endif
    echomsg 'User configuration is overloaded!'
  enddef
endif
command ReloadConfigs g:ReloadConfigs()
