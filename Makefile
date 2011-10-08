.PHONY:install all

all:
	@echo 'Install instructions:'
	@echo '1. Put the repository in your home directory and rename to .vim'
	@echo '2. cd into .vim and issue `make install`'

install_vundle:
	cd bundle && git clone https://github.com/gmarik/vundle.git vundle

install:install_vundle
	cd ~ && ln -s .vim/.vimrc .vimrc
	cd ~ && ln -s .vim/.gvimrc .gvimrc
