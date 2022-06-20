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
	@echo '   make install_sublime_text        install sublime text files         '
	@echo '   make install_sublime_merge       install sublime merge files        '
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
	dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profiles.dconf

clean_bash:
	rm -Rf ~/.ctags
	rm -Rf ~/.bash_aliases

export_bash:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > `pwd`/gnome-terminal-profiles.dconf


install_gtk:
	ln -sf `pwd`/config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
	ln -sf `pwd`/config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

clean_gtk:
	rm -Rf ~/.config/gtk-3.0/gtk.css
	rm -Rf ~/.config/gtk-3.0/settings.css

install_sublime_text: clear_sublime_text
	@echo Place sublime-text config files
	ln -sf `pwd`/config/sublime-text/Packages/User   ~/.config/sublime-text/Packages/User
# 	TODO: add clone packages

clear_sublime_text:
	rm -Rf ~/.config/sublime-text/Packages/User


install_sublime_merge: clear_sublime_merge
	@echo Place sublime-merge config files
	ln -sf `pwd`/config/sublime-merge/Packages/User   ~/.config/sublime-merge/Packages/User

clear_sublime_merge:
	rm -Rf ~/.config/sublime-merge/Packages/User
