" Vim color file
" Name: light
" A vibrant light theme

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "light"

" GUI color definitions
let s:gui00 = "#000000"
let s:gui01 = "#B33333"
let s:gui02 = "#36A168"
let s:gui03 = "#B58900"
let s:gui04 = "#3366ff"
let s:gui05 = "#6056a5"
let s:gui06 = "#00aaaa"
let s:gui07 = "#bbbbbb"
let s:gui08 = "#444444"
let s:gui09 = "#CC3333"
let s:gui0A = "#3DAE6E"
let s:gui0B = "#B58900"
let s:gui0C = "#4477ff"
let s:gui0D = "#7066b5"
let s:gui0E = "#00bbbb"
let s:gui0F = "#ffffff"
let s:guiBG = "#ffffff"
let s:guiFG = "#000000"
" Terminal color definitions
let s:cterm00 = "00"
let s:cterm01 = "31"
let s:cterm02 = "32"
let s:cterm03 = "33"
let s:cterm04 = "34"
let s:cterm05 = "35"
let s:cterm06 = "36"
let s:cterm07 = "37"
let s:cterm08 = "90"
let s:cterm09 = "91"
let s:cterm0A = "92"
let s:cterm0B = "93"
let s:cterm0C = "94"
let s:cterm0D = "95"
let s:cterm0E = "96"
let s:cterm0F = "97"

" Highlighting function
fun! <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfun

" General UI colors
call <sid>hi("Normal", s:guiFG, s:guiBG, s:cterm00, "NONE", "", "")
call <sid>hi("NonText", s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("EndOfBuffer", s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("LineNr", s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("SignColumn", s:gui07, s:guiBG, s:cterm07, "NONE", "", "")
call <sid>hi("Comment", s:gui07, "", s:cterm07, "", "", "")
call <sid>hi("VertSplit", s:gui07, s:guiBG, s:cterm07, "NONE", "", "")
call <sid>hi("StatusLine", s:guiFG, s:gui07, s:cterm00, s:cterm07, "NONE", "")
call <sid>hi("StatusLineNC", s:gui07, s:guiBG, s:cterm07, "NONE", "NONE", "")
call <sid>hi("Cursor", s:guiBG, s:guiFG, "NONE", "NONE", "", "")
call <sid>hi("CursorLine", "", "#e6e6f2", "", "254", "NONE", "")
call <sid>hi("CursorLineNr", s:guiFG, "#e6e6f2", s:cterm00, "254", "NONE", "")
call <sid>hi("CursorColumn", "", "#e6e6f2", "", "254", "", "")
call <sid>hi("ColorColumn", "", "#e6e6f2", "", "254", "", "")
call <sid>hi("Visual", "", "#e6e6f2", "", "254", "", "")
call <sid>hi("Search", s:guiBG, s:gui03, s:cterm00, s:cterm03, "", "")
call <sid>hi("IncSearch", s:guiBG, s:gui03, s:cterm00, s:cterm03, "NONE", "")
call <sid>hi("Pmenu", s:guiFG, s:guiBG, s:cterm00, "254", "", "")
call <sid>hi("PmenuSel", s:gui0D, s:gui0F, s:cterm00, s:cterm04, "", "")

" Syntax highlighting
call <sid>hi("Constant", s:gui02, "", s:cterm02, "", "", "")
call <sid>hi("String", s:gui02, "", s:cterm02, "", "", "")
call <sid>hi("Number", s:gui04, "", s:cterm04, "", "", "")
call <sid>hi("Boolean", s:gui04, "", s:cterm04, "", "", "")
call <sid>hi("Character", s:gui02, "", s:cterm02, "", "", "")
call <sid>hi("Float", s:gui04, "", s:cterm04, "", "", "")
call <sid>hi("Identifier", s:gui05, "", s:cterm05, "", "NONE", "")
call <sid>hi("Function", s:gui0D, "", s:cterm0D, "", "", "")
call <sid>hi("Statement", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("Conditional", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("Repeat", s:gui06, "", s:cterm06, "", "", "")
call <sid>hi("Label", s:gui06, "", s:cterm06, "", "", "")
call <sid>hi("Operator", s:gui06, "", s:cterm06, "", "", "")
call <sid>hi("Keyword", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("PreProc", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("Type", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("Special", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("Error", s:gui01, s:guiBG, s:cterm01, "NONE", "", "")
call <sid>hi("Todo", s:gui03, s:guiBG, s:cterm03, "NONE", "bold", "")


" Git highlighting
call <sid>hi("gitcommitOverflow", s:gui01, "", s:cterm01, "", "", "")
call <sid>hi("gitcommitHeader", s:gui05, "", s:cterm05, "", "", "")
call <sid>hi("gitcommitSelectedType", s:gui04, "", s:cterm04, "", "", "")
call <sid>hi("gitcommitSelectedFile", s:gui04, "", s:cterm04, "", "", "")
call <sid>hi("gitcommitDiscardedType", s:gui01, "", s:cterm01, "", "", "")
call <sid>hi("gitcommitDiscardedFile", s:gui01, "", s:cterm01, "", "", "")

" Diff highlighting
call <sid>hi("DiffAdd", s:gui02, s:guiBG, s:cterm02, "NONE", "", "")
call <sid>hi("DiffChange", s:gui03, s:guiBG, s:cterm03, "NONE", "", "")
call <sid>hi("DiffDelete", s:gui01, s:guiBG, s:cterm01, "NONE", "", "")
call <sid>hi("DiffText", s:gui04, s:guiBG, s:cterm04, "NONE", "", "")

highlight! NormalFloat guibg=NONE
highlight! FloatBorder guibg=NONE guifg=#505050

highlight! link BlinkCmpMenu NormalFloat
highlight! link BlinkCmpMenuBorder FloatBorder


" Dark gray (for normal kind)
highlight! BlinkCmpKind guibg=NONE guifg=#444444

" Blue group (for variables, interfaces, text)
highlight! BlinkCmpKindVariable guibg=NONE guifg=#87afd7
highlight! BlinkCmpKindInterface guibg=NONE guifg=#87afd7
highlight! BlinkCmpKindText guibg=NONE guifg=#87afd7

" Purple group (for functions, methods)
highlight! BlinkCmpKindFunction guibg=NONE guifg=#8787af
highlight! BlinkCmpKindMethod guibg=NONE guifg=#8787af

" Green group (for classes, structs)
highlight! BlinkCmpKindClass guibg=NONE guifg=#5f875f
highlight! BlinkCmpKindStruct guibg=NONE guifg=#5f875f

" Light gray group (for keywords, properties, units)
highlight! BlinkCmpKindKeyword guibg=NONE guifg=#6c6c6c
highlight! BlinkCmpKindProperty guibg=NONE guifg=#6c6c6c
highlight! BlinkCmpKindUnit guibg=NONE guifg=#6c6c6c

" Orange group (for constructors, fields)
highlight! BlinkCmpKindConstructor guibg=NONE guifg=#ff8700
highlight! BlinkCmpKindField guibg=NONE guifg=#ff8700

" Light green group (for constants, values)
highlight! BlinkCmpKindConstant guibg=NONE guifg=#87af87
highlight! BlinkCmpKindValue guibg=NONE guifg=#87af87

" Dark purple group (for enums, enum members)
highlight! BlinkCmpKindEnum guibg=NONE guifg=#5f5f87
highlight! BlinkCmpKindEnumMember guibg=NONE guifg=#5f5f87

" Cyan group (for modules, snippets)
highlight! BlinkCmpKindModule guibg=NONE guifg=#5fafaf
highlight! BlinkCmpKindSnippet guibg=NONE guifg=#5fafaf

" Red group (for events, operators)
highlight! BlinkCmpKindEvent guibg=NONE guifg=#af5f5f
highlight! BlinkCmpKindOperator guibg=NONE guifg=#af5f5f

" Light blue (for type parameters)
highlight! BlinkCmpKindTypeParameter guibg=NONE guifg=#5f87af

" Yellow group (for files, folders)
highlight! BlinkCmpKindFile guibg=NONE guifg=#ffffaf
highlight! BlinkCmpKindFolder guibg=NONE guifg=#ffffaf

" Medium gray group (for references, colors)
highlight! BlinkCmpKindReference guibg=NONE guifg=#6c6c6c
highlight! BlinkCmpKindColor guibg=NONE guifg=#6c6c6c

highlight! MiniIndentscopeSymbol guifg=#bbbbbb

highlight! WinSeparator guifg=#bbbbbb
highlight! FzfLuaBorder guifg=#bbbbbb

" Delete functions
delf <sid>hi

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03 s:gui04 s:gui05 s:gui06 s:gui07
unlet s:gui08 s:gui09 s:gui0A s:gui0B s:gui0C s:gui0D s:gui0E s:gui0F
unlet s:guiBG s:guiFG
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07
unlet s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
