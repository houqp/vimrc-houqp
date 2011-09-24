"for pathogen
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

"Set mapleader
let mapleader = ","

syntax enable

""""""""""""""""""""""""""""""
" tab and indent
""""""""""""""""""""""""""""""
filetype plugin indent on
" expand tab to spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
"show tab 
set list
set listchars=tab:▸\ 

set autoindent
set cindent
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType c,cpp setlocal noexpandtab


set nu
set cursorline              " 突出显示当前行
"set cursorcolumn              " 突出显示当前列
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"set the number of changes that are remembered
set undolevels=200
set modifiable
set write
set foldenable
set foldmethod=syntax
"highlight Folded ctermbg=black
"highlight Folded ctermfg=darkmagenta
"highlight Folded guibg=white
let loaded_csExplorer = 1		"not load the color preview plugin

"Fast saving
nmap <leader>w :w!<cr>

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
" auto motion for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"工作目录随文件变
"autocmd BufEnter * cd %:p:h
set autochdir
" Set to auto read when a file is changed from the outside
set autoread
" reload vimrc when it is changed
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .gvimrc source ~/.gvimrc
autocmd! bufwritepost .vim-all.vim source ~/.vim/.vim-all.vim
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

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
"vim will quit if there are only explorer windows
let g:persistentBehaviour = 0


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
" markbrowser setting
""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap CTRL-F1 :!cts<cr>
"F5 for compling
nmap <M-F5> :make<cr>
"jumpping between the errors
nmap <M-F7> :cn<cr>
nmap <M-F8> :cp<cr>

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"toggle hex mode
map <leader>h :call ToggleHexMode()<cr>

""""""""""""""""""""""""""""""
" Command mode related
""""""""""""""""""""""""""""""
"Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <C-F> <Right>
cnoremap <C-B> <left>

""""""""""""""""""""""""""""""
" abbreviations for spelling correct
""""""""""""""""""""""""""""""
iab szie size
iab SZIE SIZE

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
"set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

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

