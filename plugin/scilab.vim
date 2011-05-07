" Vim syntax file
" Language:	Scilab
" Maintainer:	Patricio Toledo <patoledo@ing.puc.cl>, from matlab.sci
" Last Change:  vie may 17 18:43:08 CLT 2002

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword scilabStatement		return
syn keyword scilabLabel			case switch
syn keyword scilabConditional		else elseif end if otherwise
syn keyword scilabRepeat		do for while

syn keyword scilabTodo			contained  TODO

" If you do not want these operators lit, uncommment them and the "hi link" below
syn match scilabArithmeticOperator	"[-+]"
syn match scilabArithmeticOperator	"\.\=[*/\\^]"
syn match scilabRelationalOperator	"[=~]="
syn match scilabRelationalOperator	"[<>]=\="
syn match scilabLogicalOperator		"[&|~]"
syn match scilabLineContinuation	"\.\{3}"

"syn match scilabIdentifier		"\<\a\w*\>"

" String
syn region scilabString			start=+'+ end=+'+	oneline

" If you don't like tabs
syn match scilabTab			"\t"
" Standard numbers
syn match scilabNumber			"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match scilabFloat			"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match scilabFloat			"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"
" Transpose character and delimiters: Either use just [...] or (...) aswell
syn match scilabDelimiter		"[][]"
syn match scilabDelimiter		"[][()]"
syn match scilabTransposeOperator	"[])a-zA-Z0-9.]'"lc=1
syn match scilabSizeOperator     	"\$"
syn match scilabSemicolon		";"
syn match scilabColon		        ","
syn match scilabComment			"//.*$"	contains=scilabTodo,scilabTab
syn match scilabError			"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match scilabError			"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

syn keyword scilabFunction	error eval function 
syn keyword scilabOperator	break return default margin round clear
syn keyword scilabOperator      ones zeros eye rand ceil floor size fix
syn keyword scilabOperator      find isdef isinf isnan isreal
syn keyword scilabOperator      sort triu tril conj
syn keyword scilabImplicit	norm abs exp log log10 log2
syn keyword scilabImplicit      prod sum max min sign sqrt
syn keyword scilabStatistic     mean median std cov
syn keyword scilabTrigonometric cos acos sin asin tan atan        
syn keyword scilabHiperbol      cosh acosh sinh asinh tanh atanh        
syn keyword scilabVectorize     matrix repmat matrices kron  sub2ind ind2sub
syn keyword scilabSparse        sparse speye spget spones sprand spzeros nnz
syn keyword scilabPlot          champ colormap contour contourf champ plot
syn keyword scilabPlot          replot polarplot subplot xaxis xtitle

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scilab_syntax_inits")
  if version < 508
    let did_scilab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink scilabOperator			Operator
  HiLink scilabStatistic		Operator
  HiLink scilabTrigonometric 		Operator
  HiLink scilabHiperbolic		Operator
  HiLink scilabVectorize		Operator
  HiLink scilabSparse   		Operator
  HiLink scilabPlot     		Operator
  HiLink scilabTransposeOperator	Operator
  HiLink scilabSizeOperator      	Float
  HiLink scilabFloat			Float
  HiLink scilabFunction			Function
  HiLink scilabLineContinuation		Special
  HiLink scilabLabel			Label
  HiLink scilabConditional		Conditional
  HiLink scilabRepeat			Repeat
  HiLink scilabString			String
  HiLink scilabDelimiter		Identifier
  HiLink scilabTransposeOther		Identifier
  HiLink scilabNumber			Number
  HiLink scilabError			Error
  HiLink scilabTodo			Todo
  HiLink scilabImplicit			Statement
  HiLink scilabStatement		Statement
  HiLink scilabSemicolon		SpecialChar
  HiLink scilabColon			SpecialChar
  HiLink scilabComment			Comment
  HiLink scilabArithmeticOperator	scilabOperator
  HiLink scilabRelationalOperator	scilabOperator
  HiLink scilabLogicalOperator		scilabOperator

"optional highlighting
  "HiLink scilabIdentifier		Identifier
  "HiLink scilabTab			Error

  delcommand HiLink
endif

let b:current_syntax = "scilab"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
