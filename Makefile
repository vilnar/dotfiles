#
# Makefile for dotfiles
#
SHELL=/bin/bash

help:
	@echo 'Makefile for dotfiles                                                  '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make install_bash                install bashrc                     '
	@echo '   make install_vim                 install vim files                  '
	@echo '   make install_git                 install git files                  '
	@echo '   make import_gnome_terminal       import gnome-terminal profile      '
	@echo '   make export_gnome_terminal       export gnome-terminal profile      '
	@echo '   make install_gtk                 install gtk files                  '
	@echo '   make install_sublime_text        install sublime text files         '
	@echo '   make install_sublime_merge       install sublime merge files        '
	@echo '                                                                       '
	@echo 'WARNING: when install configuration files, the files are first deleted '
	@echo 'to avoid conflicts                                                     '
	@echo '                                                                       '


install_vim:
	@echo Place vim config files
	ln -sf `pwd`/vim   ~/.vim


install_git:
	cp `pwd`/gitconfig ~/.gitconfig


install_bash:
	ln -sf `pwd`/ctags   ~/.ctags
	cp `pwd`/bash_aliases ~/.bash_aliases


install_kitty:
	ln -sf `pwd`/config/kitty   ~/.config/kitty


import_gnome_terminal:
	dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profiles.dconf

export_gnome_terminal:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > `pwd`/gnome-terminal-profiles.dconf


install_alacritty:
	ln -sf `pwd`/config/alacritty ~/.config/alacritty
	ln -sf `pwd`/config/alacritty/nord.yml ~/.config/nord.yml


install_gtk:
	ln -sf `pwd`/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
	ln -sf `pwd`/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini


install_sublime_text:
	@echo Place sublime-text config files
	ln -sf `pwd`/config/sublime-text/Packages/User   ~/.config/sublime-text/Packages/User
	ln -sf `pwd`/config/sublime-text/Packages/Default   ~/.config/sublime-text/Packages/Default
	ln -sf `pwd`/config/sublime-text/Packages/Dictionaries   ~/.config/sublime-text/Packages/Dictionaries
	ln -sf `pwd`/config/sublime-text/Packages/Markdown   ~/.config/sublime-text/Packages/Markdown
	ln -sf `pwd`/config/sublime-text/Packages/PHP   ~/.config/sublime-text/Packages/PHP
	ln -sf `pwd`/config/sublime-text/Packages/FileDiffs   ~/.config/sublime-text/Packages/FileDiffs
	ln -sf `pwd`/config/sublime-text/Packages/Tab\ Filter   ~/.config/sublime-text/Packages/Tab\ Filter
	ln -sf `pwd`/config/sublime-text/Packages/sublimetext-translate   ~/.config/sublime-text/Packages/sublimetext-translate

install_sublime_merge:
	@echo Place sublime-merge config files
	ln -sf `pwd`/config/sublime-merge/Packages/User   ~/.config/sublime-merge/Packages/User


install_vscode:
	@echo Place vscode config files
	ln -sf `pwd`/config/Code/User/settings.json   ~/.config/Code/User/settings.json
	ln -sf `pwd`/config/Code/User/keybindings.json   ~/.config/Code/User/keybindings.json

export_vscode_extensions:
	code --list-extensions > `pwd`/config/Code/User/list-extensions.txt

import_vscode_extensions:
	cat `pwd`/config/Code/User/list-extensions.txt| xargs -L 1 echo code --install-extension


install_emacs:
	@echo Place emacs config files
	ln -sf `pwd`/emacs.d   ~/.emacs.d
