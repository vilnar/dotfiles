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

all: install_bash install_vim install_git
	@echo ""
	@echo "dotfiles install"
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
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-commentary/doc/" -c q
	git clone https://github.com/tpope/vim-surround  ~/.vim/pack/vendor/start/vim-surround
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-surround/doc/" -c q
	git clone https://github.com/preservim/nerdtree  ~/.vim/pack/vendor/start/nerdtree
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc/" -c q
	git clone https://github.com/tpope/vim-fugitive  ~/.vim/pack/vendor/start/vim-fugitive
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-fugitive/doc/" -c q
	git clone https://github.com/arthurxavierx/vim-caser  ~/.vim/pack/vendor/start/vim-caser
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-caser/doc/" -c q
	git clone https://github.com/SirVer/ultisnips ~/.vim/pack/vendor/start/ultisnips
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/ultisnips/doc/" -c q
	git clone https://github.com/jlanzarotta/bufexplorer ~/.vim/pack/vendor/start/bufexplorer
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/bufexplorer/doc/" -c q
	git clone https://github.com/skywind3000/asyncrun.vim ~/.vim/pack/vendor/start/asyncrun
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/asyncrun/doc/" -c q
	git clone https://github.com/jparise/vim-graphql ~/.vim/pack/vendor/start/vim-graphql
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/vim-graphql/doc/" -c q
	git clone https://github.com/exvim/ex-utility ~/.vim/pack/vendor/start/ex-utility
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/ex-utility/doc/" -c q
	git clone https://github.com/exvim/ex-tags ~/.vim/pack/vendor/start/ex-tags
	vim -u NONE -c "helptags ~/.vim/pack/vendor/start/ex-tags/doc/" -c q

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
