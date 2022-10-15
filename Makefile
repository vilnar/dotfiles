#
# Makefile for dotfiles
#
SHELL=/bin/bash

help:
	@echo 'Makefile for dotfiles                                                  '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make all                         install everything                 '
	@echo '   make install_bash                install bashrc                     '
	@echo '   make install_vim                 install vim files                  '
	@echo '   make install_git                 install git files                  '
	@echo '   make import_gnome_terminal       import gnome-terminal profile      '
	@echo '   make export_gnome_terminal       export gnome-terminal profile      '
	@echo '   make install_gtk                 install gtk files                  '
	@echo '                                                                       '
	@echo 'WARNING: when install configuration files, the files are first deleted '
	@echo 'to avoid conflicts                                                     '
	@echo '                                                                       '

all: install_bash install_vim install_git install_gtk
	@echo ""
	@echo "dotfiles install"
	@echo "=================================="
	@echo ""
	@echo "All done."


install_vim: clean_vim
	@echo Place vim config files
	ln -sf `pwd`/vim   ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim -u NONE -c "PlugInstall" -c q

clean_vim:
	rm -Rf ~/.vimrc
	rm -Rf ~/.vim


install_git: clean_git
	cp `pwd`/gitconfig ~/.gitconfig

clean_git:
	rm -Rf ~/.gitconfig


install_bash: clean_bash
	ln -sf `pwd`/ctags   ~/.ctags
	cp `pwd`/bash_aliases ~/.bash_aliases

clean_bash:
	rm -Rf ~/.ctags
	rm -Rf ~/.bash_aliases

install_kitty: clear_kitty
	ln -sf `pwd`/config/kitty   ~/.config/kitty

clear_kitty:
	rm -Rf ~/.config/kitty

import_gnome_terminal:
	dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profiles.dconf

export_gnome_terminal:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > `pwd`/gnome-terminal-profiles.dconf


install_gtk:
	ln -sf `pwd`/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
	ln -sf `pwd`/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

clean_gtk:
	rm -Rf ~/.config/gtk-3.0/gtk.css
	rm -Rf ~/.config/gtk-3.0/settings.css

install_codium: clear_codium
	@echo Place codium config files
	ln -sf `pwd`/config/VSCodium/User/settings.json   ~/.config/VSCodium/User/settings.json
	ln -sf `pwd`/config/VSCodium/User/keybindings.json   ~/.config/VSCodium/User/keybindings.json

export_codium_extensions:
	codium --list-extensions > `pwd`/config/VSCodium/User/list-extensions.txt

import_codium_extensions:
	cat `pwd`/config/VSCodium/User/list-extensions.txt| xargs -L 1 echo codium --install-extension

clear_codium:
	rm ~/.config/VSCodium/User/settings.json
	rm ~/.config/VSCodium/User/keybindings.json