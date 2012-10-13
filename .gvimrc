source ~/.vim/allrc.vim

set cursorline

"Use gvim in X automatically so the color scheme looks better
if &term=~"xterm"
    gui
endif


if has('gui_macvim')
	set gfw=WenQuanYi\ Micro\ Hei\ Mono:h16
else
	set guifont=bitstream\ vera\ sans\ mono\ 11
	set gfw=WenQuanYi\ Micro\ Hei\ 11
	colorscheme freya
endif


"If in gvim, use a better colorscheme

"不显示工具条
set guioptions-=T
set guioptions-=m

