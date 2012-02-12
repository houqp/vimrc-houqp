""""""""""""""""""""""""""""""
" setting for vundle
""""""""""""""""""""""""""""""
set nocompatible
"filetype off

set rtp+=~/.vim/bundle/vundle/

set rtp+=~/.vim/bundles/vim-dokuwiki/
let g:dokuwiki_enable_key_mappings = 1

set rtp+=~/.vim/bundles/mytemplates/
set rtp+=~/.vim/bundles/cscope-related/
set rtp+=~/.vim/bundles/conkyrc/
set rtp+=~/.vim/bundles/linux-kernel.vim/
call vundle#rc()

Bundle 'gmarik/vundle'

" --- languages
Bundle 'c.vim'
"Bundle 'OmniCppComplete'
Bundle 'moin.vim'
Bundle 'sukima/xmledit'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'maxima.vim'
Bundle 'Puppet-Syntax-Highlighting'
"Bundle 'houqp/vim-dokuwiki'
Bundle 'bufexplorer.zip'
Bundle 'octave.vim--'
Bundle 'scilab.vim'
Bundle 'johnbintz/vim-puppet'

" --- web dev
Bundle 'lilydjwg/colorizer'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'mattn/zencoding-vim'
Bundle 'nono/jquery.vim'
Bundle 'tpope/vim-haml'

" --- dev tools
"Bundle 'neocomplcache'
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'po.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'VOoM'
"Bundle 'cscope_plus.vim'
"Bundle 'autoload_cscope.vim'
"Bundle 'Marks-Browser'
Bundle 'ShowMarks'
" display function parameter/prototypes in preview
Bundle 'autoproto.vim' 

" --- misc
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/vim-statline'
Bundle 'AutoComplPop'

filetype plugin indent on


"Set mapleader
let mapleader = ","

syntax enable

""""""""""""""""""""""""""""""
" tab and indent
""""""""""""""""""""""""""""""
" expand tab to spaces
set noexpandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"show tab 
set list
set listchars=tab:▸\ 
set autoindent
set cindent

set nu
set cursorline              " 突出显示当前行
"set cursorcolumn              " 突出显示当前列
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"set the number of changes that are remembered
set undolevels=200
set modifiable
set write
"set foldenable
set foldmethod=syntax
set foldcolumn=1
"highlight Folded ctermbg=black
"highlight Folded ctermfg=darkmagenta
"highlight Folded guibg=white
let loaded_csExplorer = 1		"not load the color preview plugin

" find tags file recursively from current directory to root directory
set tags=tags;


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For special file type
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType dokuwiki setlocal expandtab shiftwidth=2 softtabstop=2
"au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"autocmd BufRead *.js set syntax=jquery
" @TODO this does not work after LoadSession()
autocmd FileType javascript set syntax=jquery
"autocmd FileType markdown Voom markdown 
"autocmd FileType asciidoc Voom asciidoc 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch	"search every word you type
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
map <silent> <leader><cr> :noh<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto motion for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"工作目录随文件变
"autocmd BufEnter * cd %:p:h
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

" 让 Tohtml 产生有 CSS 语法的 html
" syntax/2html.vim，可以用:runtime! syntax/2html.vim
let html_use_css=1

"for omnicppcomplete
set nocp
filetype plugin on


""""""""""""""""""""""""""""""
" omni
""""""""""""""""""""""""""""""
imap <C-L> <C-x><C-o>
set completeopt=longest,menu

let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase


"""""""""""""""""""""""""""""""
" Taglist
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 35
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
map <Leader>tl :TlistToggle <bar> TlistUpdate <cr>


"""""""""""""""""""""""""""""""
" WinManage
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout='TagList'
"nmap wm :WMToggle<cr>


""""""""""""""""""""""""""""""
" vim-latex	
""""""""""""""""""""""""""""""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


""""""""""""""""""""""""""""""
"	use vim in man page
""""""""""""""""""""""""""""""
let $PAGER=''


""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 


""""""""""""""""""""""""""""""
" Some mappinn
""""""""""""""""""""""""""""""
" switch between two windows
nmap <leader><TAB> :wincmd p<cr>
nmap CTRL-F1 :!cts<cr>
"F5 for compling
nmap <M-F5> :make<cr>
"jumpping between the errors
nmap <M-F7> :cn<cr>
nmap <M-F8> :cp<cr>

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :call ToggleSpellCheck()<cr>

"toggle hex mode
map <leader>h :call ToggleHexMode()<cr>

"Fast saving
nmap <leader>w :w!<cr>
imap <C-s> <esc>:w<cr>a

"for FuzzyFinder
nmap <leader>f :FufFile<cr>
nmap <leader>bf :FufBuffer<cr>


""""""""""""""""""""""""""""""
" Command mode related
""""""""""""""""""""""""""""""
"Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-F> <Right>
cnoremap <C-B> <left>


""""""""""""""""""""""""""""""
" abbreviations for spelling correct
""""""""""""""""""""""""""""""
function! ToggleSpellCheck()
	setlocal spell!
	"@TODO: save old value
	"s:old_balloonexpr = balloonexpr
	set balloonexpr=SpellBalloon()
	set ballooneval!
endfunction

function! SpellBalloon()
	let lines = spellsuggest( spellbadword(v:beval_text)[0], 5, 0 )
	return join( lines, has("balloon_multiline") ? "\n" : "" )
endfunction

iab szie size
iab SZIE SIZE


""""""""""""""""""""""""""""""
" Statusline

""""""""""""""""""""""""""""""

set encoding=utf-8 " Necessary to show unicode glyphs

" Always show the statusline
"set laststatus=2

" Format the statusline
"set statusline=\ [CWD:\%r%{CurDir()}%h]\ %{HasPaste()}%f%m%r%h%w\ 
		"\[TYPE=%Y]\ \ Line:\ %l/%L:%c\ [ASCII=\%03.3b,\ HEX=\%02.2B]

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
"mark place holder
match Todo /<+.\++>/
nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=blank,help
set sessionoptions+=resize,winpos
if !exists("g:session_dir")
	let g:session_dir = ""
endif

" session is only enabled for gvim with no arguments
" if g:session_dir != "", then session_mode is set
" Session.vim not found, set session_mode 

autocmd! GUIEnter * 
			\	if argc() == 0 | 
			\		if filereadable("Session.vim") |
			\			let g:session_dir = CurDir() |
			\			source Session.vim |
			\			source $MYGVIMRC |
			\		else |
			\			let g:session_dir = "?" |
			\ endif

autocmd! VimLeave * call SaveSession()

nmap <leader>ms :call SaveSession()<cr>

function! SaveSession()
	if g:session_dir != "" 
		" session_mode is set
		if g:session_dir != "?"
			" already loaded from a session, save to the original Session.vim
			execute 'mksession! ' . g:session_dir . '/Session.vim'
		else
			" session_mode is set, create a new Session.vim
			mksession! Session.vim
			let g:session_dir = CurDir()
		endif
	endif
endfunction


