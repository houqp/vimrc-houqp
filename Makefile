.PHONY:install all

all:
	@echo 'Install instructions:'
	@echo '1. Put the repository in your home directory and rename to .vim'
	@echo '2. cd into ~/.vim and run `make install`'

install:
	-cd ~ && ln -s .vim/.vimrc .vimrc
	-cd ~ && ln -s .vim/.gvimrc .gvimrc
	-cd ~ && ln -s .vim .nvim
	-cd ~ && ln -s .vimrc .nvimrc
	@echo "You also need cmake, go, cargo, npm, jdk, libclang for autocomplete."
	@echo "Mac: brew install llvm python python3 npm cmake go"
	@echo "     brew cask install java"
	@echo "     pip install neovim --upgrade"
	cd ~/.vim/plugged/YouCompleteMe/ && ./install.py \
		--clang-completer \
		--rust-completer \
		--java-completer \
		--ts-completer \
		--go-completer
