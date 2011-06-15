set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "freya-term"

highlight Normal ctermbg=235 cterm=none guibg=#2a2a2a gui=none ctermfg=253 guifg=#dcdccc

highlight Cursor guibg=fg gui=none cterm=none guifg=bg
highlight CursorColumn guibg=#3f3f3f gui=none ctermbg=238 cterm=none
highlight CursorLine guibg=#3f3f3f gui=none ctermbg=238 cterm=none guifg=fg
highlight DiffAdd guibg=#008b00 gui=none ctermbg=28 cterm=none guifg=fg
highlight DiffChange guibg=#00008b gui=none ctermbg=18 cterm=none guifg=fg
highlight DiffDelete guibg=#8b0000 gui=none ctermbg=88 cterm=none guifg=fg
highlight DiffText guibg=#0000cd gui=bold ctermbg=20 cterm=bold guifg=fg
highlight Directory guibg=bg gui=none cterm=none guifg=#d4b064 ctermfg=179
highlight ErrorMsg guibg=bg gui=bold cterm=bold guifg=#f07070 ctermfg=210
highlight FoldColumn ctermbg=bg cterm=none guibg=bg gui=none ctermfg=186 guifg=#c2b680
highlight Folded ctermbg=233 cterm=none guibg=#101010 gui=none ctermfg=186 guifg=#c2b680
highlight IncSearch guibg=#866a4f gui=none ctermbg=95 cterm=none guifg=fg
highlight LineNr guibg=bg gui=none cterm=none guifg=#9f8f80 ctermfg=138
highlight ModeMsg guibg=bg gui=bold cterm=bold guifg=fg
highlight MoreMsg guibg=bg gui=bold cterm=bold guifg=#dabfa5 ctermfg=181
highlight NonText guibg=bg gui=bold cterm=bold guifg=#9f8f80 ctermfg=138
highlight Pmenu ctermbg=137 cterm=none guibg=#a78869 gui=none ctermfg=16 guifg=#000000
highlight PmenuSbar guibg=#b99f86 gui=none ctermbg=138 cterm=none guifg=fg
highlight PmenuSel guibg=#c0aa94 gui=none ctermbg=138 cterm=none guifg=bg
highlight PmenuThumb guibg=#f7f7f1 gui=none ctermbg=231 cterm=none guifg=bg
highlight Question guibg=bg gui=bold cterm=bold guifg=#dabfa5 ctermfg=181
highlight Search guibg=#c0aa94 gui=none ctermbg=138 cterm=none guifg=bg
highlight SignColumn ctermbg=bg cterm=none guibg=bg gui=none ctermfg=186 guifg=#c2b680
"hi SpecialKey guibg=bg guifg=#d4b064 gui=none
highlight SpecialKey guibg=bg gui=none cterm=none guifg=#423d33 ctermfg=238
if has("spell")
highlight SpellBad gui=undercurl cterm=undercurl guisp=#f07070
highlight SpellCap gui=undercurl cterm=undercurl guisp=#7070f0
highlight SpellLocal gui=undercurl cterm=undercurl guisp=#70f0f0
highlight SpellRare gui=undercurl cterm=undercurl guisp=#f070f0
endif
highlight StatusLine ctermbg=95 cterm=bold guibg=#736559 gui=bold ctermfg=231 guifg=#f7f7f1
highlight StatusLineNC ctermbg=240 cterm=none guibg=#564d43 gui=none ctermfg=231 guifg=#f7f7f1
highlight TabLine ctermbg=240 cterm=underline guibg=#564d43 gui=underline ctermfg=231 guifg=#f7f7f1
highlight TabLineFill ctermbg=240 cterm=underline guibg=#564d43 gui=underline ctermfg=231 guifg=#f7f7f1
highlight TabLineSel guibg=bg gui=bold cterm=bold guifg=#f7f7f1 ctermfg=231
highlight Title gui=bold cterm=bold guifg=#f7f7f1 ctermfg=231
highlight VertSplit ctermbg=240 cterm=none guibg=#564d43 gui=none ctermfg=231 guifg=#f7f7f1
if version >= 700
highlight Visual guibg=#5f5f5f gui=none ctermbg=59 cterm=none
else
highlight Visual ctermbg=59 cterm=none guibg=#5f5f5f gui=none ctermfg=0 guifg=fg
endif
highlight VisualNOS guibg=bg gui=bold,underline cterm=bold,underline guifg=#c0aa94 ctermfg=138
highlight WarningMsg guibg=bg gui=none cterm=none guifg=#f07070 ctermfg=210
highlight WildMenu guibg=#c0aa94 gui=bold ctermbg=138 cterm=bold guifg=bg

highlight Comment guibg=bg gui=none cterm=none guifg=#c2b680 ctermfg=186
highlight Constant guibg=bg gui=none cterm=none guifg=#afe091 ctermfg=150
highlight Error guibg=bg gui=none cterm=none guifg=#f07070 ctermfg=210
highlight Identifier guibg=bg gui=none cterm=none guifg=#dabfa5 ctermfg=181
highlight Ignore guibg=bg gui=none cterm=none guifg=bg
hi lCursor guibg=#c0aa94 guifg=bg gui=none
highlight MatchParen guibg=#008b8b gui=none ctermbg=30 cterm=none
highlight PreProc guibg=bg gui=none cterm=none guifg=#c2aed0 ctermfg=182
highlight Special guibg=bg gui=none cterm=none guifg=#d4b064 ctermfg=179
highlight Statement guibg=bg gui=bold cterm=bold guifg=#e0af91 ctermfg=180
highlight Todo guibg=#aed0ae gui=none ctermbg=151 cterm=none guifg=bg
highlight Type guibg=bg gui=bold cterm=bold guifg=#dabfa5 ctermfg=181
highlight Underlined guibg=bg gui=underline cterm=underline guifg=#d4b064 ctermfg=179

hi htmlBold ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold
hi htmlItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=italic
hi htmlUnderline ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=underline
hi htmlBoldItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,italic
hi htmlBoldUnderline ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,underline
hi htmlBoldUnderlineItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=bold,underline,italic
hi htmlUnderlineItalic ctermbg=0 ctermfg=15 guibg=bg guifg=fg gui=underline,italic
