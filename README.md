# Dotfiles

## Help

```
make help
```

## Requirements

```
sudo apt install git make fd-find
```

[fzf](https://github.com/junegunn/fzf)

[ctags](https://github.com/universal-ctags/ctags)

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
