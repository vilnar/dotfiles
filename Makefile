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
	@echo '                                                                       '
	@echo 'All install commands are also available as clean commands to remove    '
	@echo 'installed files                                                        '
	@echo '                                                                       '

all: install_vim install_git
	@echo ""
	@echo "dotfiles - Making yourself at home"
	@echo "=================================="
	@echo ""
	@echo "All done."

install_vim: clean_vim
	@echo Place vim config files
	ln -sf `pwd`/vimrc ~/.vimrc
	ln -sf `pwd`/vim   ~/.vim
	@echo Installing plugins
	rm -Rf ~/.vim/pack/vendor/start
	mkdir -p ~/.vim/pack/vendor/start
	git clone https://github.com/tpope/vim-commentary  ~/.vim/pack/vendor/start/vim-commentary
	vim -c "helptags ~/.vim/pack/vendor/start/vim-commentary/doc/ |q"
	git clone https://github.com/tpope/vim-surround  ~/.vim/pack/vendor/start/vim-surround
	vim -c "helptags ~/.vim/pack/vendor/start/vim-surround/doc/ |q"
	git clone https://github.com/preservim/nerdtree  ~/.vim/pack/vendor/start/nerdtree
	vim -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc/ |q"
	git clone https://github.com/tpope/vim-fugitive  ~/.vim/pack/vendor/start/vim-fugitive
	vim -c "helptags ~/.vim/pack/vendor/start/vim-fugitive/doc/ |q"
	git clone https://github.com/arthurxavierx/vim-caser  ~/.vim/pack/vendor/start/vim-caser
	vim -c "helptags ~/.vim/pack/vendor/start/vim-caser/doc/ |q"
	git clone https://github.com/SirVer/ultisnips ~/.vim/pack/vendor/start/ultisnips
	vim -c "helptags ~/.vim/pack/vendor/start/ultisnips/doc/ |q"
	git clone https://github.com/jlanzarotta/bufexplorer ~/.vim/pack/vendor/start/bufexplorer
	vim -c "helptags ~/.vim/pack/vendor/start/bufexplorer/doc/ |q"

clean_vim:
	rm -Rf ~/.vimrc
	rm -Rf ~/.vim

install_git: clean_git
	cp `pwd`/gitconfig ~/.gitconfig

clean_git:
	rm -Rf ~/.gitconfig

install_bash: clean_bash
	cp `pwd`/bash_aliases ~/.bash_aliases
	dconf load /org/gnome/terminal/legacy/profiles:/ < `pwd`/gnome-terminal-profiles.dconf

clean_bash:
	rm -Rf ~/.bash_aliases

export_bash:
	dconf dump /org/gnome/terminal/legacy/profiles:/ > `pwd`/gnome-terminal-profiles.dconf
