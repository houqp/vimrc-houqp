""""""""""""""""""""""""""""""
" setting for vundle
""""""""""""""""""""""""""""""
set nocompatible
"filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundles/vim-dokuwiki/
set rtp+=~/.vim/bundles/mytemplates/
set rtp+=~/.vim/bundles/cscope-related/
set rtp+=~/.vim/bundles/conkyrc/
call vundle#rc()

Bundle 'gmarik/vundle'

"language
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

"web dev
Bundle 'lilydjwg/colorizer'
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'mattn/zencoding-vim'
Bundle 'taglist.vim'
Bundle 'autoproto.vim'

"dev tools
Bundle 'neocomplcache'
Bundle 'po.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'VOoM'
"Bundle 'cscope_plus.vim'
"Bundle 'autoload_cscope.vim'
"Bundle 'Marks-Browser'
Bundle 'ShowMarks'

"misc
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-easymotion'
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
"autocmd FileType markdown Voom markdown 
"autocmd FileType asciidoc Voom asciidoc 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=blank
set sessionoptions+=resize,winpos
let g:session_dir = ""
autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()
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

function! LoadSession()
	if has("gui_running") && argc() == 0 
		" session is only enabled for gvim with no arguments
		" if g:session_dir != "", then session_mode is set
		if filereadable("Session.vim")
			let g:session_dir = CurDir()
			silent source Session.vim
		else
			" Session.vim not found, set session_mode 
			let g:session_dir = "?"
		endif
	endif
endfunction


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
autocmd! bufwritepost .vimrc source $HOME/.vimrc
autocmd! bufwritepost .gvimrc source $HOME/.gvimrc
autocmd! bufwritepost allrc.vim source $HOME/.vim/allrc.vim
" input method auto close
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
" Always show the statusline
set laststatus=2

" Format the statusline
set statusline=\ [CWD:\%r%{CurDir()}%h]\ %{HasPaste()}%f%m%r%h%w\ 
		\[TYPE=%Y]\ \ Line:\ %l/%L:%c\ [ASCII=\%03.3b,\ HEX=\%02.2B]

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



""""""""""""""""""""""""""""""
" NeoComplCache
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" enalbe quick match
"let g:neocomplcache_enable_quick_match = 1

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
    "\ }

let g:neocomplcache_dictionary_filetype_lists = { 'default' : '' }
 
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
