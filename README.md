# Dotfiles

## Help

```
make help
```

## Requirements

```
git
make
rg
fzf
```


## submodules

### add plugin

```
git submodule add {plugin_repo} vim/pack/plugins/start/{plugin_name}
git submodule add {plugin_repo} config/sublime-text/Packages/{plugin_name}
git submodule add {plugin_repo} emacs.d/site-lisp/{plugin_name}
```

### remove plugin
```
git rm -f vim/pack/plugins/start/{plugin_name}
rm -rf .git/modules/vim/pack/plugins/start/{plugin_name}

git rm -f config/sublime-text/Packages/{plugin_name}
rm -rf .git/modules/config/sublime-text/Packages/{plugin_name}

git rm -f emacs.d/site-lisp/{plugin_name}
rm -rf .git/modules/emacs.d/site-lisp/{plugin_name}
```
