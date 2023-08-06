source ~/.vim/allrc.vim

set t_Co=256

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" colorscheme base16-eighties
" colorscheme freya-term
set background=dark  " for gruvbox
colorscheme everforest

set backspace=2

source $HOME/.vim/nvim/init.lua
