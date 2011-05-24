.PHONY: update-plugin

update-plugin:
	cd ./my-plugin-tree/vim-latex && git pull origin

install:
	cd ./bundle && ln -s ../my-plugin-tree/vim-latex/vimfiles vim-latex
