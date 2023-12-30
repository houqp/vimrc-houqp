.PHONY:install all

all:
	@echo 'Install instructions:'
	@echo '1. Put the repository in your home directory and rename to .vim'
	@echo '2. cd into ~/.vim and run `make install`'

install:
	ln -fs ~/.vim/.vimrc ~/.vimrc
	ln -fs ~/.vim/.gvimrc ~/.gvimrc
	ln -fs ~/.vim ~/.config/nvim
