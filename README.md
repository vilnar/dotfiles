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
```


## submodules

### add plugin

```
git submodule add {plugin_repo} vim/pack/plugins/start/{plugin_name}
```

### remove plugin
```
git rm -f vim/pack/plugins/start/{plugin_name}
rm -rf .git/modules/vim/pack/plugins/start/{plugin_name}
```
