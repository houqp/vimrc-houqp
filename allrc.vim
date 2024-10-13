set nocompatible
filetype off

filetype plugin indent on

" use lazyredraw to speed things up. Ruby syntax highlight is too slow wihtout this
set lazyredraw
autocmd VimEnter * redraw!  " workaround for missing statusline when entering vim in some terminals

syntax enable

set mouse=a  " enable mouse mode in terminal
" copy selected text by default on click release
vmap <2-LeftRelease> "*ygv
vmap <3-LeftRelease> "*ygv

""""""""""""""""""""""""""""""
" Default tab and indent
""""""""""""""""""""""""""""""
" expand tab to spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For special file type
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType haml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType dokuwiki setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType terraform setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType nix setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
""""""""""""""""""""""""""""""
" Ruby syntax highlight is horrible in Vim
""""""""""""""""""""""""""""""
autocmd FileType ruby set regexpengine=1 foldmethod=manual norelativenumber nocursorline
	\ expandtab tabstop=2 softtabstop=2 shiftwidth=2
""""""""""""""""""""""""""""""
" Jenkinsfile highlight
""""""""""""""""""""""""""""""
au BufNewFile,BufRead Jenkinsfile setf groovy

"show tab
set list
" start with ▸ and fill the remaining with spaces
set listchars=tab:▸\ " we have an extra space at the end
set autoindent
set cindent
" enable true color in terminal
set termguicolors

" persistent undo support
if !isdirectory($HOME."/.vim/undo-dir")
	call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

set nu
" set scroll offset
set so=7
" highlight current line
set cursorline
" highlight colorcolumn 100
if exists('+colorcolumn')
    set colorcolumn=100
    highlight ColorColumn guibg=#333333
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
"set the number of changes that are remembered
set undolevels=200
set modifiable
set write
set foldcolumn=1

" find tags file recursively from current directory to root directory
set tags=tags;


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch	"search every word you type
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto motion for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change working dir to folder that hosts current file being edited
set autochdir
" Set to auto read when a file is changed from the outside
set autoread

" reload vimrc when it is changed
autocmd! BufWritePost .vimrc,.gvimrc,allrc.vim
			\	if has("gui_running") |
			\		source $MYGVIMRC |
			\	else |
			\		source $MYVIMRC |
			\	endif

" auto disable input method
autocmd! InsertLeave * set imdisable
autocmd! InsertEnter * set noimdisable

""""""""""""""""""""""""""""""
" Some other mappings
""""""""""""""""""""""""""""""
" switch between two windows
nmap <leader><TAB> :wincmd p<cr>

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :call ToggleSpellCheck()<cr>

"toggle hex mode
map <leader>h :call ToggleHexMode()<cr>

"Fast saving
nmap <leader>w :w!<cr>
imap <C-s> <esc>:w<cr>a

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""
" Command mode related mappings
""""""""""""""""""""""""""""""""
"Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-F> <Right>
cnoremap <C-B> <left>

"""""""""""""""""""""""""""""""""""""
" Abbreviations for spelling correct
"""""""""""""""""""""""""""""""""""""
function! ToggleSpellCheck()
	setlocal spell!
    highlight SpellBad ctermfg=1 guifg=#BF616A gui=underline
    highlight SpellCap ctermfg=1 guifg=#BF616A gui=underline
    highlight SpellLocal ctermfg=1 guifg=#BF616A gui=underline
    highlight SpellRare ctermfg=1 guifg=#BF616A gui=underline
endfunction

iab szie size
iab SZIE SIZE

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
set encoding=utf-8 " Necessary to show unicode glyphs

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

""""""""""""""""""""""""""""""
" Toggle hex mode
""""""""""""""""""""""""""""""
let s:hexMode = "N"

function! ToggleHexMode()
  if s:hexMode == "Y"
    %!xxd -r
    let s:hexMode = "N"
  else
    %!xxd
    let s:hexMode = "Y"
  endif
endfunction

""""""""""""""""""""""""""""""
" Place holder
""""""""""""""""""""""""""""""
nnoremap <c-j> /<+.\{-1,}><cr>c/+>/e<cr>
inoremap <c-j> <ESC>/<+.\{-1,}><cr>c/+>/e<cr>

""""""""""""""""""""""""""""""
" Font size helper function
" From: http://vim.wikia.com/wiki/Change_font_size_quickly
""""""""""""""""""""""""""""""
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

""""""""""""""""""""""""""""""
" disable the stupid ex mode
""""""""""""""""""""""""""""""
nnoremap Q <Nop>
