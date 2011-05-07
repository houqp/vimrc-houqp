" Vim ftplugin for PO file (GNU gettext) editing.
" This script is a fork version of Aleksandar Jelenak's script. Since the 
" last change by the original creator is long time ago and I failed to get in
" tough with him via email, I started this project by myself. Nearly 90% of
" the script is written by Aleksandar Jelenak. I fixed two bugs and add three
" other functions and remapped the keys. Thanks to Aleksandar Jelenak a lot.
" Original Creator:	Aleksandar Jelenak <ajelenak AT yahoo.com>
" Modifier: Grissiom <chaos.proton AT gmail.com>
" Last Change by Original Creator:	Tue, 12 Apr 2005 13:49:55 -0400
"
" *** Latest version of original script: http://www.vim.org/scripts/script.php?script_id=695 ***
" *** Latest version of modified verion:
" http://repo.or.cz/w/grissiom.projects.git?a=blob_plain;f=vim/ftplugin/po.vim ***
"
" DESCRIPTION
"     This file is a Vim ftplugin for editing PO files (GNU gettext -- the GNU
"     i18n and l10n system). It automates over a dozen frequent tasks that
"     occur while editing files of this type.
"
"                                                    
"     Action (Insert mode)                           Key mappings
"     =======================================================
"     Move to a string (transl. or untransl) forward      \m
"     Move to a string (transl. or untransl) backward     \M
"     Begain to comment this entry                        \C
"     Move to an untransl. string forward                 \u
"     Move to an untransl. string backward                \U
"     Copy the msgid string to msgstr                     \c
"     Delete the msgstr string                            \d
"     Move to the next fuzzy translation                  \f
"     Move to the previous fuzzy translation              \F
"     Label the translation fuzzy                         \z
"     Remove the fuzzy label                              \Z
"     Show msgfmt statistics for the file(*)              \s
"     Browse through msgfmt errors for the file(*)        \e
"     Put the translator info in the header               \t
"     Put the lang. team info in the header               \l
"     Format the whole file(wrap the lines etc.)          \W
"     -------------------------------------------------------
"     (*) Only available on UNIX computers.
"
"
"                                                      
"     Action (Normal mode)                           Key mappings
"     =======================================================
"     Move to a string (transl. or untransl) forward      \m
"     Move to a string (transl. or untransl) backward     \M
"     Begain to comment this entry                        \C
"     Move to an untransl. string forward                 \u
"     Move to an untransl. string backward                \U
"     Move to the next fuzzy translation                  \f
"     Move to the previous fuzzy translation              \F
"     Label the translation fuzzy                         \z
"     Remove the fuzzy label                              \Z
"     Split-open the file under cursor                    gf
"     Show msgfmt statistics for the file(*)              \s
"     Browse through msgfmt errors for the file(*)        \e
"     Put the translator info in the header               \t
"     Put the lang. team info in the header               \l
"     Format the whole file(wrap the lines etc.)          \W
"     -------------------------------------------------------
"     (*) Only available on UNIX computers.
"
"     Remarks:
"     - "S" in the above key mappings stands for the <Shift> key and "\" in
"       fact means "<LocalLeader>" (:help <LocalLeader>), which is "\" by
"       Vim's default.
"     - Information about the translator and language team is supplied by two
"       global variables: 'g:po_translator' and 'g:po_lang_team'. They should
"       be defined in the ".vimrc" (UNIX) or "_vimrc" (Windows) file. If they
"       are not defined, the default values (descriptive strings) are put
"       instead.
"     - Vim's "gf" Normal mode command is remapped (local to the PO buffer, of
"       course). It will only function on lines starting with "#: ". Search
"       for the file is performed in the directories specified by the 'path'
"       option. The user can supply its own addition to this option via the
"       'g:po_path' global variable. Its default value for PO files can be
"       found by typing ":set path?" from within a PO buffer. For the correct
"       format please see ":help 'path'". Warning messages are printed if no
"       or more than one file is found.
"     - Vim's Quickfix mode (see ":help quickfix") is used for browsing
"       through msgfmt-reported errors for the file. No MO file is created
"       when running the msgfmt program since its output is directed to
"       "/dev/null". The user can supply command-line arguments to the msgfmt
"       program via the global variable 'g:po_msgfmt_args'. All arguments are
"       allowed except the "-o" for output file. The default value is
"       "-vv -c".
"     - Format the whole file is actually using msgmerge a.po a.po -o a.po.
"       Since we must reload the file that has been modified, you could not
"       do any Undo once you run this function.
"
"     But there's even more!
"
"     Every time the PO file is saved, a PO-formatted time stamp is
"     automatically added to the file header. Note that if the file is marked
"     'fuzzy', i.e, there is a "#, fuzzy" in the head of the file, the time
"     stamp will not be updated.
"
" INSTALLATION
"     Put this file in a Vim ftplugin directory. On UNIX computers it is
"     usually either "~/.vim/ftplugin" or "~/.vim/after/ftplugin". On Windows
"     computers, the defaults are "$VIM\vimfiles\ftplugin" or
"     "$VIM\vimfiles\after\ftplugin". For more information consult the Vim
"     help, ":help 'ftplugin'" and ":help 'runtimepath'".
"
" REMOVAL
"     Just delete the bloody file!

" Only do this when not done yet for this buffer.
if exists("b:did_po_mode_ftplugin")
	finish
endif
let b:did_po_mode_ftplugin = 1

setlocal comments=
setlocal errorformat=%f:%l:\ %m
setlocal makeprg=msgfmt

let b:po_path = '.,..,../src,../src/*'
if exists("g:po_path")
	let b:po_path = b:po_path . ',' . g:po_path
endif
exe "setlocal path=" . b:po_path
unlet b:po_path

" Move to a string (transl. or untransl) forward
if !hasmapto('<Plug>NextStringFWD')
	imap <buffer> <unique> <LocalLeader>m <Plug>NextStringFWD
	nmap <buffer> <unique> <LocalLeader>m <Plug>NextStringFWD
endif
inoremap <buffer> <unique> <Plug>NextStringFWD <ESC>/^msgstr\(\[\d\]\)\=<CR>:let @/=""<CR>:call histdel("/", -1)<CR>z.f"a
nnoremap <buffer> <unique> <Plug>NextStringFWD /^msgstr\(\[\d\]\)\=<CR>:let @/=""<CR>:call histdel("/", -1)<CR><C-L>z.

" Move to a string (transl. or untransl) backward
if !hasmapto('<Plug>NextStringBWD')
	imap <buffer> <unique> <LocalLeader>M <Plug>NextStringBWD
	nmap <buffer> <unique> <LocalLeader>M <Plug>NextStringBWD
endif
inoremap <buffer> <unique> <Plug>NextStringBWD <ESC>{{/^msgstr\(\[\d\]\)\=<CR>:let @/=""<CR>:call histdel("/", -1)<CR>z.f"a
nnoremap <buffer> <unique> <Plug>NextStringBWD {{/^msgstr\(\[\d\]\)\=<CR>:let @/=""<CR>:call histdel("/", -1)<CR><C-L>z.

" Begain to comment this entry
if !hasmapto('<Plug>Commententry')
	imap <buffer> <unique> <LocalLeader>C <Plug>Commententry
	nmap <buffer> <unique> <LocalLeader>C <Plug>Commententry
endif
inoremap <buffer> <unique> <Plug>Commententry <ESC>{o#<Space>
nnoremap <buffer> <unique> <Plug>Commententry {o#<Space>

" Move to the first untranslated msgstr string forward.
if !hasmapto('<Plug>NextTransFwd')
	imap <buffer> <unique> <LocalLeader>u <Plug>NextTransFwd
	nmap <buffer> <unique> <LocalLeader>u <Plug>NextTransFwd
endif
inoremap <buffer> <unique> <Plug>NextTransFwd <ESC>/^msgstr\(\[\d\]\)\=\s*""\(\n\n\\|\%$\)<CR>:let @/=""<CR>:call histdel("/", -1)<CR>z.f"a
nnoremap <buffer> <unique> <Plug>NextTransFwd /^msgstr\(\[\d\]\)\=\s*""\(\n\n\\|\%$\)<CR>:let @/=""<CR>:call histdel("/", -1)<CR><C-L>z.f"

" Move to the first untranslated msgstr string backward.
if !hasmapto('<Plug>NextTransBwd')
	imap <buffer> <unique> <LocalLeader>U <Plug>NextTransBwd
	nmap <buffer> <unique> <LocalLeader>U <Plug>NextTransBwd
endif
" If the cursor is in a empty entry, it will not move. So move a step first.
fu! <SID>crline()
	if getline('.') =~ '^msgstr\s*""$'
		normal! {
	endif
endf
inoremap <buffer> <unique> <Plug>NextTransBwd <ESC>:call <SID>crline()<CR>?^msgstr\(\[\d\]\)\=\s*""\(\n\n\\|\%$\)<CR>:let @/=""<CR>:call histdel("/", -1)<CR>z.f"a
nnoremap <buffer> <unique> <Plug>NextTransBwd :call <SID>crline()<CR>?^msgstr\(\[\d\]\)\=\s*""\(\n\n\\|\%$\)<CR>:let @/=""<CR>:call histdel("/", -1)<CR><C-L>z.f"

" Copy original msgid string into msgstr string.
if !hasmapto('<Plug>CopyMsgid')
	imap <buffer> <unique> <LocalLeader>c <Plug>CopyMsgid
	nmap <buffer> <unique> <LocalLeader>c <Plug>CopyMsgid
endif
inoremap <buffer> <unique> <Plug>CopyMsgid <ESC>}?^msgid<CR>:let @/=""<CR>:call histdel("/", -1)<CR>f"y/^msgstr<CR>/^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR>f""_d$pa
nnoremap <buffer> <unique> <Plug>CopyMsgid <ESC>}?^msgid<CR>:let @/=""<CR>:call histdel("/", -1)<CR>f"y/^msgstr<CR>/^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR>f""_d$p

" Erase the translation string.
if !hasmapto('<Plug>DeleteTrans')
	imap <buffer> <unique> <LocalLeader>d <Plug>DeleteTrans
endif
inoremap <buffer> <unique> <Plug>DeleteTrans <ESC>}?^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR>f"lc}"<ESC>i

" Move to the first fuzzy translation forward.
if !hasmapto('<Plug>NextFuzzy')
	imap <buffer> <unique> <LocalLeader>f <Plug>NextFuzzy
	nmap <buffer> <unique> <LocalLeader>f <Plug>NextFuzzy
endif
inoremap <buffer> <unique> <Plug>NextFuzzy <ESC>/^#,\(.*,\)\=\s*fuzzy<CR>:let @/=""<CR>:call histdel("/", -1)<CR>/^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR>z.$i
nnoremap <buffer> <unique> <Plug>NextFuzzy /^#,\(.*,\)\=\s*fuzzy<CR>:let @/=""<CR>:call histdel("/", -1)<CR>/^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR><C-L>z.$

" Move to the first fuzzy descriptor backward.
if !hasmapto('<Plug>PreviousFuzzy')
	imap <buffer> <unique> <LocalLeader>F <Plug>PreviousFuzzy
	nmap <buffer> <unique> <LocalLeader>F <Plug>PreviousFuzzy
endif
inoremap <buffer> <unique> <Plug>PreviousFuzzy <ESC>{?^#,\(.*,\)\=\s*fuzzy<CR>:let @/=""<CR>:call histdel("/", -1)<CR>/^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR>z.$i
nnoremap <buffer> <unique> <Plug>PreviousFuzzy {?^#,\(.*,\)\=\s*fuzzy<CR>:let @/=""<CR>:call histdel("/", -1)<CR>/^msgstr<CR>:let @/=""<CR>:call histdel("/", -1)<CR><C-L>z.$

" Insert fuzzy description for the translation.
if !hasmapto('<Plug>InsertFuzzy')
	imap <buffer> <unique> <LocalLeader>z <Plug>InsertFuzzy
	nmap <buffer> <unique> <LocalLeader>z <Plug>InsertFuzzy
endif
inoremap <buffer> <unique> <Plug>InsertFuzzy <ESC>{vap:call <SID>InsertFuzzy()<CR>gv<ESC>}i
nnoremap <buffer> <unique> <Plug>InsertFuzzy {vap:call <SID>InsertFuzzy()<CR>gv<ESC>}

fu! <SID>InsertFuzzy() range
	let n = a:firstline
	let n = n + 1
	while n <= a:lastline
		let line = getline(n)
		if line =~ '^#,.*fuzzy'
			return
		elseif line =~ '^#,'
			call setline(n, substitute(line, '#,','#, fuzzy,', ""))
			return
		elseif line !~ '^#'
			call append(n-1, '#, fuzzy')
			return
		endif
		let n = n + 1
	endwhile
endf

" Remove fuzzy description from the translation.
if !hasmapto('<Plug>RemoveFuzzy')
	imap <buffer> <unique> <LocalLeader>Z <Plug>RemoveFuzzy
	nmap <buffer> <unique> <LocalLeader>Z <Plug>RemoveFuzzy
endif
inoremap <buffer> <unique> <Plug>RemoveFuzzy <ESC>{vap:call <SID>RemoveFuzzy()<CR>i
nnoremap <buffer> <unique> <Plug>RemoveFuzzy {vap:call <SID>RemoveFuzzy()<CR>

fu! <SID>RemoveFuzzy()
	let line = getline(".")
	if line =~ '^#,\s*fuzzy$'
		exe "normal! dd"
	elseif line =~ '^#,\(.*,\)\=\s*fuzzy'
		exe 's/,\s*fuzzy//'
	endif
endf

" Show PO translation statistics. (Only available on UNIX computers for now.)
if has("unix")
	if !hasmapto('<Plug>MsgfmtStats')
		imap <buffer> <unique> <LocalLeader>s <Plug>MsgfmtStats
		nmap <buffer> <unique> <LocalLeader>s <Plug>MsgfmtStats
	endif
	inoremap <buffer> <unique> <Plug>MsgfmtStats <ESC>:call <SID>Msgfmt('stats')<CR>
	nnoremap <buffer> <unique> <Plug>MsgfmtStats :call <SID>Msgfmt('stats')<CR>

	if !hasmapto('<Plug>MsgfmtTest')
		imap <buffer> <unique> <LocalLeader>e <Plug>MsgfmtTest
		nmap <buffer> <unique> <LocalLeader>e <Plug>MsgfmtTest
	endif
	inoremap <buffer> <unique> <Plug>MsgfmtTest <ESC>:call <SID>Msgfmt('test')<CR>
	nnoremap <buffer> <unique> <Plug>MsgfmtTest :call <SID>Msgfmt('test')<CR>

	fu! <SID>Msgfmt(action)
		" Check if the file needs to be saved first.
		exe "if &modified | w | endif"
		if a:action == 'stats'
			exe "!msgfmt --statistics -o /dev/null %"
		elseif a:action == 'test'
			if exists("g:po_msgfmt_args")
				let args = g:po_msgfmt_args
			else
				let args = '-vv -c'
			endif
			exe "make! " . args . " -o /dev/null %"
			copen
		endif
	endf
endif

" Add translator info in the file header.
if !hasmapto('<Plug>TranslatorInfo')
	imap <buffer> <unique> <LocalLeader>t <Plug>TranslatorInfo
	nmap <buffer> <unique> <LocalLeader>t <Plug>TranslatorInfo
endif
inoremap <buffer> <unique> <Plug>TranslatorInfo <ESC>:call <SID>AddHeaderInfo('person')<CR>i
nnoremap <buffer> <unique> <Plug>TranslatorInfo :call <SID>AddHeaderInfo('person')<CR>

" Add language team info in the file header.
if !hasmapto('<Plug>LangTeamInfo')
	imap <buffer> <unique> <LocalLeader>l <Plug>LangTeamInfo
	nmap <buffer> <unique> <LocalLeader>l <Plug>LangTeamInfo
endif
inoremap <buffer> <unique> <Plug>LangTeamInfo <ESC>:call <SID>AddHeaderInfo('team')<CR>i
nnoremap <buffer> <unique> <Plug>LangTeamInfo :call <SID>AddHeaderInfo('team')<CR>

fu! <SID>AddHeaderInfo(action)
	if a:action == 'person'
		let search_for = 'Last-Translator'
		if exists("g:po_translator")
			let add = g:po_translator
		else
			let add = 'YOUR NAME <E-MAIL@ADDRESS>'
		endif
	elseif a:action == 'team'
		let search_for = 'Language-Team'
		if exists("g:po_lang_team")
			let add = g:po_lang_team
		else
			let add = 'LANGUAGE TEAM <E-MAIL@ADDRESS or HOME PAGE>'
		endif
	else
		" Undefined action -- just do nothing.
		return
	endif
	let search_for = '"' . search_for . ':'
	let add = add . '\\n"'

	normal! 1G
	if search('^' . search_for)
		silent! exe 's/^\(' . search_for . '\).*$/\1 ' . add
	endif
	call histdel("/", -1)
endf

" Write automagically PO-formatted time stamp every time the file is saved.
augroup PoFileTimestamp
	au!
	au BufWrite *.po,*.po.gz call <SID>PoFileTimestamp()
augroup END

fu! <SID>PoFileTimestamp()
	" Prepare for cleanup at the end of this function.
	let hist_search = histnr("/")
	let old_report = 'set report='.&report
	let &report = 100
	let cursor_pos_cmd = line(".").'normal! '.virtcol(".").'|'
	normal! H
	let scrn_pos = line(".").'normal! zt'

	" Put in time stamp.
	" only update time stamp for unfuzzy translations
	normal! 1G
	/^msgid
	if (!search('^#, fuzzy$', 'b')) && search('^"PO-Revision-Date:')
		silent! exe 's/^\("PO-Revision-Date:\).*$/\1 ' . strftime("%Y-%m-%d %H:%M%z") . '\\n"'
	endif

	" Cleanup and restore old cursor position.
	while histnr("/") > hist_search && histnr("/") > 0
		call histdel("/", -1)
	endwhile
	exe scrn_pos
	exe cursor_pos_cmd
	exe old_report
endf

" On "gf" Normal mode command, split window and open the file under the
" cursor.
if !hasmapto('<Plug>OpenSourceFile')
	map <buffer> <unique> gf <Plug>OpenSourceFile
endif
noremap <buffer> <unique> <Plug>OpenSourceFile :call <SID>OpenSourceFile()<CR>

" This opens the file under the cursor in a split-window.
fu! <SID>OpenSourceFile()
	" Check if we're at the right line. Return if not.
	if getline(".") !~ '^#:\s\+' | return | endif

	" Get the reference, check it, and return if it doesn't have the assumed
	" format.
	let ref = expand("<cWORD>")
	if ref !~ ':\d\+$' | return | endif

	" Split the reference into the file name and the line number parts.
	let d = match(ref, ':')
	let flnm = strpart(ref, 0, d)
	let lnr = strpart(ref, d+1, 100)

	" Start searching for the file in the directories specified with the 'path'
	" option.
	let ff = globpath(&path, flnm)

	" Check what's been found. Report if no or more than one file found and
	" return.
	if ff == ''
		echohl WarningMsg | echo "No file found in the path."
		echohl None
		exe "normal \<Esc>"
	elseif match(ff, "\n") > 0
		echohl WarningMsg | echo "More than one file found: " . ff . "\nAborting."
		echohl None
		exe "normal \<Esc>"
	else
		" Split the window and open the file at the correct line.
		execute "silent sp +" . lnr . " " . ff
	endif
endf

" Format the whole file with msgmerge(merge itself with itself)
" note after fomating the whole file you may lost your position.
if !hasmapto('fmt_whole_file')
	imap <buffer> <unique> <LocalLeader>W <Plug>fmt_whole_file
	nmap <buffer> <unique> <LocalLeader>W <Plug>fmt_whole_file
endif
inoremap <buffer> <unique> <Plug>fmt_whole_file <ESC>:call <SID>fmt_whole_file()<CR>a
nnoremap <buffer> <unique> <Plug>fmt_whole_file :call <SID>fmt_whole_file()<CR><CR>

fu! <SID>fmt_whole_file()
	let fn=bufname('%')
	" Check if the file needs to be saved first.
	exe "if &modified | w | endif"
	exe "!msgmerge ".fn." ".fn." "."-o ".fn
	exe "e!"

	" it seems that this method could change both the file in the disk and
	" the buffer. So it may not be so safe as the farmer method.
	"exe "!msgmerge % % -o %"
endf
