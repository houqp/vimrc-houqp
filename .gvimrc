source ~/.vim/vim-all.vim

set cursorline

"Use gvim in X automatically so the color scheme looks better
if &term=~"xterm"
    gui
endif

set guifont=bitstream\ vera\ sans\ mono\ 11

"If in gvim, use a better colorscheme
colorscheme freya

"不显示工具条
set guioptions-=T

