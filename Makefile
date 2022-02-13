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
	@echo '   make export_bash                 export bash profile                '
	@echo '   make install_gtk                 install gtk files                  '
	@echo '                                                                       '
	@echo 'WARNING: when install configuration files, the files are first deleted '
	@echo 'to avoid conflicts                                                     '
	@echo '                                                                       '
# TODO: add install ctags
all: install_bash install_vim install_git install_gtk
	@echo ""
	@echo "dotfiles install"
	@echo "=================================="
	@echo ""
	@echo "All done."


install_vim: clean_vim
	@echo Place vim config files
	ln -sf `pwd`/vimrc ~/.vimrc
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
	dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profiles.dconf

clean_bash:
	rm -Rf ~/.ctags
	rm -Rf ~/.bash_aliases

export_bash:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > `pwd`/gnome-terminal-profiles.dconf

install_gtk:
	ln -sf `pwd`/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css

clean_gtk:
	rm -Rf ~/.config/gtk-3.0/gtk.css
