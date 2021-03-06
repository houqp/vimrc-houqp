set nocompatible
filetype off

let vimplug_file = expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_file)
	echo "Installing plug.vim."
	echo ""
	silent !mkdir -p ~/.vim/autoload
	silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if has('neovim')
  " The python_setup script must be sourced before plugins that need python
  runtime! plugin/python_setup.vim
  " Use unnamed registers for clipboard
  set unnamedclip
endif

set rtp+=~/.vim/bundles/mytemplates/

call plug#begin('~/.vim/plugged')

" --- languages ---
Plug 'vim-scripts/c.vim' , { 'for' : 'c' }
Plug 'sukima/xmledit' , { 'for' : 'xml' }
Plug 'lervag/vimtex', { 'for' : 'latex' }
Plug 'johnbintz/vim-puppet' , { 'for' : 'puppet' }
Plug 'xolox/vim-lua-ftplugin' , { 'for' : 'lua' }
Plug 'saltstack/salt-vim' , { 'for' : ['yaml', 'yml', 'sls'] }
Plug 'derekwyatt/vim-scala' , { 'for' : 'scala' }
Plug 'fatih/vim-go' , { 'for' : 'go' }
Plug 'ekalinin/Dockerfile.vim' , { 'for' : 'Dockerfile' }
Plug 'racer-rust/vim-racer', { 'for': ['rs', 'rust'] }
Plug 'zchee/vim-flatbuffers', { 'for': ['fbs'] }
" Plug 'Valloric/YouCompleteMe'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'xolox/vim-misc' , { 'for' : 'lua' }
Plug 'rust-lang/rust.vim' , { 'for' : 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'tfnico/vim-gradle', { 'for': 'gradle' }
Plug 'elixir-editors/vim-elixir', { 'for': ['exs', 'ex', 'eex'] }
Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'hashivim/vim-terraform', { 'for': ['tf', 'terraform'] }
" Plug 'HerringtonDarkholme/yats.vim', { 'for': 'ts' }
Plug 'keith/swift.vim', { 'for': 'swift' }


" --- web dev ---
Plug 'othree/html5.vim' , { 'for' : 'html' }
Plug 'hail2u/vim-css3-syntax' , { 'for' : ['html', 'css'] }
Plug 'mattn/emmet-vim' , { 'for' : 'html' }
Plug 'tpope/vim-haml' , { 'for' : 'haml' }
Plug 'groenewege/vim-less' , { 'for' : 'less' }
Plug 'othree/javascript-libraries-syntax.vim' , { 'for' : 'js' }
Plug 'kchmck/vim-coffee-script' , { 'for' : 'coffee' }

" --- dev tools ---
Plug 'tpope/vim-fugitive'
" > better alternative for taglist
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/autoload_cscope.vim' , { 'for': ['c', 'cpp'] }
Plug 'JamshedVesuna/vim-markdown-preview' , { 'for': ['markdown'] }
Plug 'norcalli/nvim-colorizer.lua'

" --- misc ---
" > better alternative for FuzzyFinder
" Plug 'ctrlpvim/ctrlp.vim'
" > toggle quickfix and location list
" Plug 'milkypostman/vim-togglelist'
" > pairs of bracket mappings
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'airblade/vim-rooter'  " needed to make FZF command run on project root
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- themes ---
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
" Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

" use lazyredraw to speed things up. Ruby syntax highlight is too slow wihtout this
set lazyredraw
autocmd VimEnter * redraw!  " workaround for missing statusline when entering vim in some terminals

" Set mapleader
let mapleader = ","

syntax enable

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

""""""""""""""""""""""""""""""
" Tab and indent
""""""""""""""""""""""""""""""
" expand tab to spaces
set expandtab
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
autocmd FileType haml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType dokuwiki setlocal expandtab shiftwidth=2 softtabstop=2


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


""""""""""""""""""""""""""""""
" Omni
""""""""""""""""""""""""""""""
set omnifunc=syntaxcomplete#Complete
imap <C-L> <C-x><C-o>
set completeopt=longest,menu

let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase


"""""""""""""""""""""""""""""""
" vim-buffergator
"""""""""""""""""""""""""""""""
let g:buffergator_suppress_keymaps = 1
nmap <leader>be :BuffergatorOpen<cr>

"""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }

nmap <C-p> :FzfGitFiles<cr>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! FzfProjectFiles execute 'FzfFiles' s:find_git_root()
nmap <leader>f :FzfProjectFiles<cr>

nmap <leader>bf :FzfBuffers<cr>

"""""""""""""""""""""""""""""""
" CtrlP (not used anymore)
"""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<leader>f'
" nmap <leader>f :CtrlPMixed<cr>
" nmap <leader>bf :CtrlPBuffer<cr>
nmap <leader>r :CtrlPMRU<cr>

" search by fullpath
let g:ctrlp_by_filename = 0
" avoid opening file in following window
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
" don't manage working directory
let g:ctrlp_working_path_mode = 'r'
" exclude files from MRU
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|.*\.swp$|.*\.o$'
" set custom list commands
if executable('ag')
  let list_fallback_cmd = 'find %s -type f'
else
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let list_fallback_cmd = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': list_fallback_cmd
  \ }
" disable cache since the search if fast enough
let g:ctrlp_use_caching = 0
" exclude files from file search
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a|swp|swo|swn|dep)$|tags',
  \ }
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
" show more results in completion window
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:100'


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
if executable('ag')
  """"""""""""""""""""""""""""""
  " use ag for grep
  """"""""""""""""""""""""""""""
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
  " bind \ (backward slash) to grep shortcut
  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  command! -complete=file -bar Agc silent! grep! <cword>|cwindow|redraw!
else
  set grepprg=grep\ -nH\ $*
endif

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


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
"nnoremap <c-j> /<+.\{-1,}+><cr>c/+>/e<cr>
"inoremap <c-j> <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>
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
" python-mode
""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1 " Auto fix vim python paths if virtualenv enabled
" Disable python folding because it makes autocomplete really slow
let g:pymode_folding = 0
let g:pymode_rope = 0
" Ignore long line error
let g:pymode_lint_ignore = ["E501", "W0611"]

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


""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""
let g:go_fmt_command = "gofmt"
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ }
let g:go_imports_autosave = 1


""""""""""""""""""""""""""""""
" vim-markdown-preview
""""""""""""""""""""""""""""""
let vim_markdown_preview_hotkey='<C-m>'
" display image
let vim_markdown_preview_toggle=1
" remove temp file after open in browser
let vim_markdown_preview_temp_file=1

""""""""""""""""""""""""""""""
" Ruby syntax highlight is horrible in Vim
""""""""""""""""""""""""""""""
autocmd FileType ruby set regexpengine=1 foldmethod=manual norelativenumber nocursorline
	\ expandtab tabstop=4 softtabstop=4 shiftwidth=4

""""""""""""""""""""""""""""""
" show argument list and return type in racer completion
""""""""""""""""""""""""""""""
let g:racer_experimental_completer = 1

""""""""""""""""""""""""""""""
" disable the stupid ex mode
""""""""""""""""""""""""""""""
nnoremap Q <Nop>

""""""""""""""""""""""""""""""
" Allow vim-terraform to align settings automatically with Tabularize.
""""""""""""""""""""""""""""""
let g:terraform_align=1
let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""
" enable color highlight for all file types
""""""""""""""""""""""""""""""
if has('nvim')
    lua require'colorizer'.setup()
endif

""""""""""""""""""""""""""""""
" Rust related settings
""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""
" Jenkinsfile highlight
""""""""""""""""""""""""""""""
au BufNewFile,BufRead Jenkinsfile setf groovy
