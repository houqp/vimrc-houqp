.PHONY:install all

all:
	@echo 'Install instructions:'
	@echo '1. Put the repository in your home directory and rename to .vim'
	@echo '2. cd into ~/.vim and run `make install`'

install:
	-cd ~ && ln -s .vim/.vimrc .vimrc
	-cd ~ && ln -s .vim/.gvimrc .gvimrc
	-cd ~ && ln -s .vim .config/nvim
	-cd ~ && ln -s .vim/.vimrc .config/nvim/init.vim
	@echo "You also need cmake, go, cargo, npm, jdk, libclang for autocomplete."
	@echo "Mac: brew install llvm python python3 npm cmake go ctags"
	@echo "     brew cask install java"
	@echo "     pip install neovim --upgrade"
	@echo ""
	@echo "Linux: sudo apt-get install neovim clang cmake python3-dev"
	@echo ""
	@echo "After all plugin installed, remember to run :GoUpdateBinaries and install rustfmt:"
	@echo "rustup component add rustfmt"
	cd ~/.vim/plugged/YouCompleteMe/ && python3 ./install.py \
		--clang-completer \
		--rust-completer \
		--java-completer \
		--ts-completer \
		--go-completer
