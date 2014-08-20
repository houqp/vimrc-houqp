.PHONY:install all

all:
	@echo 'Install instructions:'
	@echo '1. Put the repository in your home directory and rename to .vim'
	@echo '2. cd into .vim and issue `make install`'


install:
	-cd ~ && ln -s .vim/.vimrc .vimrc
	-cd ~ && ln -s .vim/.gvimrc .gvimrc
	-cd ~ && ln -s .vim/.gvimrc .gvimrc
	-cd ~ && ln -s .vim .nvim
	-cd ~ && ln -s .vimrc .nvimrc
	@echo "You also need libclang for autocomplete."
