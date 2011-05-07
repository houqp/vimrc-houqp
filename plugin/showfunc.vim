" Maintainer:   Dante <dantezhu@vip.qq.com>
" Last Change:  2009-10-18 00:00

let s:res=[]
let s:count=1

inoremap    <silent> (       <c-x><c-r>=EchoFunc()<cr><bs>(
inoremap    <silent> <m-=>   <c-r>=EchoFuncN()<cr><bs>
inoremap    <silent> <m-->   <c-r>=EchoFuncP()<cr><bs>
map <silent> fd :call DeFunc()<cr>
map <silent> <m-=> :call EchoFuncN()<cr>
map <silent> <m--> :call EchoFuncP()<cr>

function! s:EchoFuncDisplay()
	if len(s:res) == 0
		echo ""
		return
	endif
	echohl WarningMsg | echo s:res[s:count-1] | echohl None
endfunction

function! s:GetFunctions(fun)
	let s:res=[]
	silent! let ftags=taglist(a:fun)
	if (type(ftags)==type(0) || ((type(ftags)==type([])) && ftags==[]))
		return
	endif
	let csjavaP=-1
	if &filetype=='cs'|| &filetype=='java'
		let csjavaP=1
	elseif &filetype=='c' || &filetype=='cpp'
		let csjavaP=0
	endif
	let fil_tag=[]
	for i in ftags
		if has_key(i,'kind') && has_key(i,'name') && has_key(i,'signature')
			if (((i.kind=='p' || i.kind=='f')&&csjavaP==0) || csjavaP == 1) && i.name==a:fun " p is declare, f is defination
				let fil_tag+=[i]
			endif 
		endif
	endfor
	if fil_tag==[]
		return
	endif
	let s:count=1
	for i in fil_tag
		let name=substitute(i.cmd[2:],'^\s*','','g')
		let name=substitute(name,i.name.'.*','','g').i.name.i.signature
		let s:res+=[name.' ('.(index(fil_tag,i)+1).'/'.len(fil_tag).') '.i.filename]
	endfor
endfunction

function! EchoFunc()
	let fun = substitute(getline('.')[:col('.')-2],'\m\zs.\{-}\ze\w\+\s*$','','')
	let fun = substitute(fun,'\m\s\+','','g')
	call s:GetFunctions(fun)
	call s:EchoFuncDisplay()
endfunction

"用以用键盘来显示函数原型
function! DeFunc()
	let fun=expand("<cword>")
	call s:GetFunctions(fun)
	call s:EchoFuncDisplay()
endfunction

function! EchoFuncN()
	if s:res==[]
		return
	endif
	if s:count==len(s:res)
		let s:count=1
	else
		let s:count+=1
	endif
	call s:EchoFuncDisplay()
endfunction

function! EchoFuncP()
	if s:res==[]
		return
	endif
	if s:count==1
		let s:count=len(s:res)
	else
		let s:count-=1
	endif
	call s:EchoFuncDisplay()
endfunction
