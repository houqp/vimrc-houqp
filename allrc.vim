set nocompatible
filetype off

set rtp+=~/.vim/bundles/vim-dokuwiki/
let g:dokuwiki_enable_key_mappings = 1
set rtp+=~/.vim/bundles/mytemplates/
" replaced with autload_cscope.vim
"set rtp+=~/.vim/bundles/cscope-related/
set rtp+=~/.vim/bundles/linux-kernel.vim/
set rtp+=~/.vim/bundles/notify.vim/

" Setting up NeoBundle - the vim plugin bundler
" Credit:  http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing neobundle.vim."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows': 'make -f make_mingw32.mak',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': 'make -f make_unix.mak',
      \ } }

" --- languages ---
NeoBundle 'c.vim'
NeoBundle 'echofunc.vim'
NeoBundle 'moin.vim'
NeoBundle 'sukima/xmledit'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'maxima.vim'
NeoBundle 'Puppet-Syntax-Highlighting'
NeoBundle 'bufexplorer.zip'
NeoBundle 'octave.vim--'
NeoBundle 'scilab.vim'
NeoBundle 'johnbintz/vim-puppet'
NeoBundleLazy 'xolox/vim-lua-ftplugin' , {
      \ 'autoload' : {'filetypes' : 'lua'},
      \ 'depends' : 'xolox/vim-misc',
      \ }
NeoBundle 'saltstack/salt-vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'ekalinin/Dockerfile.vim'


"NeoBundle 'Valloric/YouCompleteMe'
NeoBundleLazy 'klen/python-mode', {
      \ 'autoload' : {
      \   'filetypes' : 'python',
      \ }}

"NeoBundle 'houqp/vim-dokuwiki'
"NeoBundle 'xolox/vim-lua-inspect'

" --- web dev ---
"NeoBundle 'lilydjwg/colorizer'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'mattn/emmet-vim'
"NeoBundle 'nono/jquery.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'groenewege/vim-less'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'ap/vim-css-color'

" --- dev tools ---
NeoBundle 'SirVer/ultisnips'
NeoBundle 'tpope/vim-fugitive'
" > better alternative for taglist
NeoBundle 'majutsushi/tagbar'
NeoBundle 'po.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'VOoM'
" > show TODO, FIXME etc.
NeoBundle 'superjudge/tasklist-pathogen'
" > for fast search inside codes
NeoBundle 'mileszs/ack.vim'
NeoBundle 'matchit.zip'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'autoload_cscope.vim'

" --- misc ---
NeoBundle 'L9'
" > better alternative for FuzzyFinder
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/vim-statline'
NeoBundle 'AutoComplPop'
" > toggle quickfix and location list
NeoBundle 'milkypostman/vim-togglelist'
" > pairs of bracket mappings
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
"NeoBundle 'tpope/vim-surround'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'airblade/vim-gitgutter'
"NeoBundle 'vim-scripts/YankRing.vim'
" for vimfiler
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler.vim'



" --- themes ---
"NeoBundle 'chriskempson/vim-tomorrow-theme'
"NeoBundle 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
"NeoBundle 'nanotech/jellybeans.vim'

filetype plugin indent on

NeoBundleCheck

"Set mapleader
let mapleader = ","

syntax enable

""""""""""""""""""""""""""""""
" Tab and indent
""""""""""""""""""""""""""""""
" expand tab to spaces
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"show tab
set list
"set listchars=tab:▸\
" start with : and fill the remaining with spaces
set listchars=tab:\:\ "we have a space here
set autoindent
set cindent

set nu
" set scroll offset
set so=7
" highlight current line
set cursorline
" highlight current column
"set cursorcolumn
" highlight colorcolumn 80
set colorcolumn=80
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set ignorecase smartcase
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden
"set the number of changes that are remembered
set undolevels=200
set modifiable
set write
"set foldenable
"set foldmethod=syntax
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
autocmd FileType haml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType dokuwiki setlocal expandtab shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.py set ft=python
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
" Auto motion for vim
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

filetype plugin on


""""""""""""""""""""""""""""""
" Omni
""""""""""""""""""""""""""""""
imap <C-L> <C-x><C-o>
set completeopt=longest,menu

let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase


"""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<leader>f'
nmap <leader>f :CtrlPMixed<cr>
nmap <leader>bf :CtrlPBuffer<cr>
nmap <leader>r :CtrlPMRU<cr>

" default search by filename
let g:ctrlp_by_filename = 1
" avoid opening file in following window
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
" don't manage working directory
let g:ctrlp_working_path_mode = 0
" exclude files from file search
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a|swp|dep)$|tags',
  \ }
" exclude files from MRU
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|.*\.swp$|.*\.o$'
"let g:ctrlp_user_command = 'find %s -type f'
" open file in current window
let g:ctrlp_open_new_file = 'r'
" follow links in searching
let g:ctrlp_follow_symlinks = 1
" switch mappings between ToggleType and PtrCur
let g:ctrlp_prompt_mappings = {
  \ 'ToggleType(1)':        ['<c-l>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-h>', '<c-down>'],
  \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-f>', '<right>'],
  \ }


"""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""
let g:tagbar_left = 1
"let g:tagbar_iconchars = ['+', '-']
let g:tagbar_iconchars = [' ▶', ' ▼']
let g:tagbar_autoshowtag = 1
let g:tagbar_width = 30
map <Leader>tl :TagbarToggle<CR>

let g:tagbar_type_tex = {
	\ 'ctagstype' : 'latex',
	\ 'kinds'     : [
		\ 's:sections',
		\ 'g:graphics',
		\ 'l:labels',
		\ 'r:refs',
		\ 'p:pagerefs'
	\ ],
	\ 'sort'    : 0,
\ }

let g:tagbar_type_md = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
	\ 'h:Heading_L1',
	\ 'i:Heading_L2',
	\ 'k:Heading_L3'
	\ ]
\ }

let g:tagbar_type_asciidoc = {
	\ 'ctagstype' : 'asciidoc',
	\ 'kinds' : [
	\ 'h:Heading_L1',
	\ 'i:Heading_L2',
	\ 'k:Heading_L3'
	\ ]
\ }

let g:tagbar_type_php = {
	\ 'ctagstype' : 'php',
    \ 'kinds' : [
        \ 'd:Constants:0',
        \ 'v:Variables:0',
        \ 'f:Functions:0',
        \ 'i:Interfaces:0',
        \ 'c:Classes:0',
        \ 'p:Properties:0',
        \ 'm:Methods:0'
    \ ],
    \ 'sro' : '::',
    \ 'kind2scope' : {
        \ 'c' : 'class',
        \ 'm' : 'method',
        \ 'f' : 'function',
        \ 'i' : 'interface'
    \ },
    \ 'scope2kind' : {
        \ 'class' : 'c',
        \ 'method' : 'm',
        \ 'function' : 'f',
        \ 'interface' : 'i'
    \ }
\ }

let g:tagbar_type_javascript = {
	\ 'ctagstype' : 'JavaScript',
	\ 'kinds'     : [
		\ 'o:objects',
		\ 'f:functions',
		\ 'a:arrays',
		\ 's:strings'
	\ ]
\ }

""""""""""""""""""""""""""""""
" Vim-LaTex
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
" Use vim in man page
""""""""""""""""""""""""""""""
let $PAGER=''


""""""""""""""""""""""""""""""
" Showmarks setting
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
" Some other mappings
""""""""""""""""""""""""""""""
" switch between two windows
nmap <leader><TAB> :wincmd p<cr>
"nmap CTRL-F1 :!cts<cr>
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
"nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
"inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
nnoremap <c-j> /<+.\{-1,}><cr>c/+>/e<cr>
inoremap <c-j> <ESC>/<+.\{-1,}><cr>c/+>/e<cr>


""""""""""""""""""""""""""""""
" Session management
""""""""""""""""""""""""""""""
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
" JavaScript libraries plugin
""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'angularjs'


""""""""""""""""""""""""""""""
" GitGutter
""""""""""""""""""""""""""""""
" turn off by default
let g:gitgutter_enabled = 0
" gitgutter display toggle
nmap <leader>gd :GitGutterToggle<CR>
" for jumpping between hunks
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>


""""""""""""""""""""""""""""""
" Vimfiler
""""""""""""""""""""""""""""""
"call vimfiler#set_execute_file('vim', 'vim')
"call vimfiler#set_execute_file('txt', 'notepad')

" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_ignore_pattern = '^\(' .
		\ '.*\.\(o\|a\|so\|swp\|swo\)' .
		\ '\|' .
		\ 'tags' .
		\ '\|' .
		\ '\.git' .
		\ '\|' .
		\ '\.svn' .
		\ '\|' .
		\ 'cscope\.\(files\|in\.out\|out\|po\.out\)' .
	\ '\)$'

" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0

" Like Textmate icons.
"let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_file_icon = '-'
"let g:vimfiler_marked_file_icon = '*'


""""""""""""""""""""""""""""""
" ack.vim
""""""""""""""""""""""""""""""

" use silver searcher for ack.vim
let g:ackprg = 'ag --nogroup --nocolor --colum'


""""""""""""""""""""""""""""""
" python-mode
""""""""""""""""""""""""""""""
let g:pymode_virtualenv=1 " Auto fix vim python paths if virtualenv enabled
let g:pymode_folding=1  " Enable python folding
let g:pymode_rope = 0

""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_filetype_blacklist =
  \ get( g:, 'ycm_filetype_blacklist',
  \   get( g:, 'ycm_filetypes_to_completely_ignore', {
  \     'notes' : 1,
  \     'markdown' : 1,
  \     'text' : 1,
  \     'unite' : 1,
  \ } ) )

