.PHONY: update-plugin

update-plugin:
	@echo -e "---[ Updating vim-latex plugin ]---------------------------\n"
	cd ./my-plugin-tree/vim-latex && git pull origin master && git merge master
	cd ./bundle/vim-css3-syntax && git pull origin master
	cd ./bundle/html5.vim && git pull origin master

install:
	cd ./bundle && ln -s ../my-plugin-tree/vim-latex/vimfiles vim-latex
	cd ~ && ln -s .vim/.vimrc .vimrc
	cd ~ && ln -s .vim/.gvimrc .gvimrc
