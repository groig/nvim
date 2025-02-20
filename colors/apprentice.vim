" Apprentice.vim -- Vim color scheme.
" Author:      Romain Lafourcade (romainlafourcade@gmail.com)
" Webpage:     https://github.com/romainl/Apprentice
" Description: Essentially a streamlining and conversion to xterm colors of 'sorcerer' by Jeet Sukumaran (jeetsukumaran@gmailcom)
" Last Change: 2020-12-19

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "apprentice"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=237 ctermfg=250 cterm=NONE guibg=#262626 guifg=#bcbcbc gui=NONE
    hi NonText ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
    hi LineNr ctermbg=237 ctermfg=242 cterm=NONE guibg=#262626 guifg=#6c6c6c gui=NONE
    hi FoldColumn ctermbg=237 ctermfg=242 cterm=NONE guibg=#262626 guifg=#6c6c6c gui=NONE
    hi Folded ctermbg=237 ctermfg=242 cterm=NONE guibg=#262626 guifg=#6c6c6c gui=NONE
    hi MatchParen ctermbg=237 ctermfg=229 cterm=NONE guibg=#262626 guifg=#ffffaf gui=NONE
    hi SignColumn ctermbg=237 ctermfg=242 cterm=NONE guibg=#262626 guifg=#6c6c6c gui=NONE
    hi Comment ctermbg=NONE ctermfg=246 cterm=italic guibg=NONE guifg=#707070 gui=italic
    hi Conceal ctermbg=NONE ctermfg=250 cterm=NONE guibg=NONE guifg=#bcbcbc gui=NONE
    hi Constant ctermbg=NONE ctermfg=172 cterm=NONE guibg=NONE guifg=#87afd7 gui=NONE
    hi Error ctermbg=NONE ctermfg=131 cterm=reverse guibg=NONE guifg=#af5f5f gui=reverse
    hi Identifier ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi PreProc ctermbg=NONE ctermfg=66 cterm=NONE guibg=NONE guifg=#5f8787 gui=NONE
    hi Special ctermbg=NONE ctermfg=65 cterm=NONE guibg=NONE guifg=#5f875f gui=NONE
    hi Statement ctermbg=NONE ctermfg=110 cterm=NONE guibg=NONE guifg=#87afd7 gui=NONE
    hi String ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#87af87 gui=NONE
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi Type ctermbg=NONE ctermfg=103 cterm=NONE guibg=NONE guifg=#8787af gui=NONE
    hi Underlined ctermbg=NONE ctermfg=66 cterm=underline guibg=NONE guifg=#5f8787 gui=underline
    hi Pmenu ctermbg=238 ctermfg=250 cterm=NONE guibg=#262626 guifg=#bcbcbc gui=NONE
    hi PmenuSbar ctermbg=240 ctermfg=NONE cterm=NONE guibg=#585858 guifg=NONE gui=NONE
    hi PmenuSel ctermbg=66 ctermfg=237 cterm=NONE guibg=#87afd7 guifg=#262626 gui=NONE
    hi PmenuThumb ctermbg=66 ctermfg=66 cterm=NONE guibg=#5f8787 guifg=#5f8787 gui=NONE
    hi ErrorMsg ctermbg=237 ctermfg=131 cterm=reverse guibg=#262626 guifg=#af5f5f gui=reverse
    hi ModeMsg ctermbg=237 ctermfg=108 cterm=reverse guibg=#262626 guifg=#87af87 gui=reverse
    hi MoreMsg ctermbg=NONE ctermfg=66 cterm=NONE guibg=NONE guifg=#5f8787 gui=NONE
    hi Question ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#87af87 gui=NONE
    hi WarningMsg ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#af5f5f gui=NONE
    hi TabLine ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
    hi TabLineFill ctermbg=238 ctermfg=238 cterm=NONE guibg=#444444 guifg=#444444 gui=NONE
    hi TabLineSel ctermbg=101 ctermfg=237 cterm=NONE guibg=#87875f guifg=#262626 gui=NONE
    hi ToolbarLine ctermbg=237 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE
    hi ToolbarButton ctermbg=240 ctermfg=250 cterm=NONE guibg=#585858 guifg=#bcbcbc gui=NONE
    hi Cursor ctermbg=242 ctermfg=NONE cterm=NONE guibg=#6c6c6c guifg=NONE gui=NONE
    hi CursorColumn ctermbg=236 ctermfg=NONE cterm=NONE guibg=#303030 guifg=NONE gui=NONE
    hi CursorLineNr ctermbg=236 ctermfg=73 cterm=NONE guibg=#303030 guifg=#5fafaf gui=NONE
    hi CursorLine ctermbg=236 ctermfg=NONE cterm=NONE guibg=#303030 guifg=NONE gui=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
    hi StatusLine ctermbg=101 ctermfg=237 cterm=NONE guibg=#87875f guifg=#262626 gui=NONE
    hi StatusLineNC ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
    hi StatusLineTerm ctermbg=101 ctermfg=237 cterm=NONE guibg=#87875f guifg=#262626 gui=NONE
    hi StatusLineTermNC ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
    hi Visual ctermbg=237 ctermfg=110 cterm=reverse guibg=#262626 guifg=#87afd7 gui=reverse
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
    hi VertSplit ctermbg=238 ctermfg=238 cterm=NONE guibg=#444444 guifg=#444444 gui=NONE
    hi WildMenu ctermbg=110 ctermfg=237 cterm=NONE guibg=#87afd7 guifg=#262626 gui=NONE
    hi Function ctermbg=NONE ctermfg=229 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
    hi Title ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi DiffAdd ctermbg=237 ctermfg=108 cterm=reverse guibg=#262626 guifg=#87af87 gui=reverse
    hi DiffChange ctermbg=237 ctermfg=103 cterm=reverse guibg=#262626 guifg=#8787af gui=reverse
    hi DiffDelete ctermbg=237 ctermfg=131 cterm=reverse guibg=#262626 guifg=#af5f5f gui=reverse
    hi DiffText ctermbg=237 ctermfg=172 cterm=reverse guibg=#262626 guifg=#d78700 gui=reverse
    hi IncSearch ctermbg=131 ctermfg=237 cterm=NONE guibg=#af5f5f guifg=#262626 gui=NONE
    hi Search ctermbg=229 ctermfg=237 cterm=NONE guibg=#ffffaf guifg=#262626 gui=NONE
    hi Directory ctermbg=NONE ctermfg=73 cterm=NONE guibg=NONE guifg=#5fafaf gui=NONE
    hi debugPC ctermbg=67 ctermfg=NONE cterm=NONE guibg=#5f87af guifg=NONE gui=NONE
    hi debugBreakpoint ctermbg=131 ctermfg=NONE cterm=NONE guibg=#af5f5f guifg=NONE gui=NONE
    hi SpellBad ctermbg=NONE ctermfg=131 cterm=undercurl guibg=NONE guifg=#af5f5f gui=undercurl guisp=#af5f5f
    hi SpellCap ctermbg=NONE ctermfg=73 cterm=undercurl guibg=NONE guifg=#5fafaf gui=undercurl guisp=#5fafaf
    hi SpellLocal ctermbg=NONE ctermfg=65 cterm=undercurl guibg=NONE guifg=#5f875f gui=undercurl guisp=#5f875f
    hi SpellRare ctermbg=NONE ctermfg=172 cterm=undercurl guibg=NONE guifg=#d78700 gui=undercurl guisp=#d78700
    hi ColorColumn ctermbg=237 ctermfg=NONE cterm=NONE guibg=#262626 guifg=NONE gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=black ctermfg=lightgrey cterm=NONE
    hi NonText ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi EndOfBuffer ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi LineNr ctermbg=black ctermfg=lightgrey cterm=NONE
    hi FoldColumn ctermbg=black ctermfg=lightgrey cterm=NONE
    hi Folded ctermbg=black ctermfg=lightgrey cterm=NONE
    hi MatchParen ctermbg=black ctermfg=yellow cterm=NONE
    hi SignColumn ctermbg=black ctermfg=lightgrey cterm=NONE
    hi Comment ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi Conceal ctermbg=NONE ctermfg=lightgrey cterm=NONE
    hi Constant ctermbg=NONE ctermfg=red cterm=NONE
    hi Error ctermbg=NONE ctermfg=darkred cterm=reverse
    hi Identifier ctermbg=NONE ctermfg=darkblue cterm=NONE
    hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=darkcyan cterm=NONE
    hi Special ctermbg=NONE ctermfg=darkgreen cterm=NONE
    hi Statement ctermbg=NONE ctermfg=blue cterm=NONE
    hi String ctermbg=NONE ctermfg=green cterm=NONE
    hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse
    hi Type ctermbg=NONE ctermfg=magenta cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=darkcyan cterm=underline
    hi Pmenu ctermbg=darkgrey ctermfg=lightgrey cterm=NONE
    hi PmenuSbar ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi PmenuSel ctermbg=darkcyan ctermfg=black cterm=NONE
    hi PmenuThumb ctermbg=darkcyan ctermfg=darkcyan cterm=NONE
    hi ErrorMsg ctermbg=black ctermfg=darkred cterm=reverse
    hi ModeMsg ctermbg=black ctermfg=green cterm=reverse
    hi MoreMsg ctermbg=NONE ctermfg=darkcyan cterm=NONE
    hi Question ctermbg=NONE ctermfg=green cterm=NONE
    hi WarningMsg ctermbg=NONE ctermfg=darkred cterm=NONE
    hi TabLine ctermbg=darkgrey ctermfg=darkyellow cterm=NONE
    hi TabLineFill ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi TabLineSel ctermbg=darkyellow ctermfg=black cterm=NONE
    hi ToolbarLine ctermbg=black ctermfg=NONE cterm=NONE
    hi ToolbarButton ctermbg=darkgrey ctermfg=lightgrey cterm=NONE
    hi Cursor ctermbg=lightgrey ctermfg=NONE cterm=NONE
    hi CursorColumn ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=darkgrey ctermfg=cyan cterm=NONE
    hi CursorLine ctermbg=darkgrey ctermfg=NONE cterm=NONE
    hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE
    hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE
    hi StatusLine ctermbg=darkyellow ctermfg=black cterm=NONE
    hi StatusLineNC ctermbg=darkgrey ctermfg=darkyellow cterm=NONE
    hi StatusLineTerm ctermbg=darkyellow ctermfg=black cterm=NONE
    hi StatusLineTermNC ctermbg=darkgrey ctermfg=darkyellow cterm=NONE
    hi Visual ctermbg=black ctermfg=blue cterm=reverse
    hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline
    hi VertSplit ctermbg=darkgrey ctermfg=darkgrey cterm=NONE
    hi WildMenu ctermbg=blue ctermfg=black cterm=NONE
    hi Function ctermbg=NONE ctermfg=yellow cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=darkgrey cterm=NONE
    hi Title ctermbg=NONE ctermfg=white cterm=NONE
    hi DiffAdd ctermbg=black ctermfg=green cterm=reverse
    hi DiffChange ctermbg=black ctermfg=magenta cterm=reverse
    hi DiffDelete ctermbg=black ctermfg=darkred cterm=reverse
    hi DiffText ctermbg=black ctermfg=red cterm=reverse
    hi IncSearch ctermbg=darkred ctermfg=black cterm=NONE
    hi Search ctermbg=yellow ctermfg=black cterm=NONE
    hi Directory ctermbg=NONE ctermfg=cyan cterm=NONE
    hi debugPC ctermbg=darkblue ctermfg=NONE cterm=NONE
    hi debugBreakpoint ctermbg=darkred ctermfg=NONE cterm=NONE
    hi SpellBad ctermbg=NONE ctermfg=darkred cterm=undercurl
    hi SpellCap ctermbg=NONE ctermfg=cyan cterm=undercurl
    hi SpellLocal ctermbg=NONE ctermfg=darkgreen cterm=undercurl
    hi SpellRare ctermbg=NONE ctermfg=red cterm=undercurl
    hi ColorColumn ctermbg=black ctermfg=NONE cterm=NONE
endif

hi link Terminal Normal
hi link Number Constant
hi link CursorIM Cursor
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Terminal Normal
hi link Typedef Type
hi link htmlTagName Statement
hi link htmlEndTag htmlTagName
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link htmlArg htmlTagName
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic Preproc
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String
hi link QuickFixLine Search
let g:terminal_ansi_colors = [
        \ '#262626',
        \ '#af5f5f',
        \ '#5f875f',
        \ '#87875f',
        \ '#5f87af',
        \ '#5f5f87',
        \ '#5f8787',
        \ '#6c6c6c',
        \ '#444444',
        \ '#ff8700',
        \ '#87af87',
        \ '#ffffaf',
        \ '#87afd7',
        \ '#8787af',
        \ '#5fafaf',
        \ '#ffffff',
        \ ]

hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.bracket Normal
hi! link @punctuation.special Special
hi! link @constant Constant
hi! link @constant.builtin Constant
hi! link @constant.macro Macro
hi! link @string.regex String
hi! link @string.escape Character
hi! link @namespace Structure
hi! link @funcion.macro Function
hi! link @property Normal
hi! link @keyword.operator Operator
hi! link @variable Normal
hi! link @text Normal
hi! link @text.underline Underlined
hi! link @tag htmlTagName
hi! link @tag.delimiter Normal

hi! link @function.builtin Function
hi! link @keyword.function Function
hi! link @exception Statement
hi! link @text.title Title
hi! link @label Statement
hi! link @symbol Number
hi! link @number Number

hi! QuickScopePrimary ctermbg=237 ctermfg=229 cterm=NONE guibg=#262626 guifg=#ffffaf gui=NONE
hi! QuickScopeSecondary ctermbg=237 ctermfg=131 cterm=NONE guibg=#262626 guifg=#87afd7 gui=NONE
hi! GitSignsChange ctermbg=237 ctermfg=242 cterm=NONE guibg=#262626 guifg=#87afd7 gui=NONE
hi! GitSignsChangeLn ctermbg=237 ctermfg=242 cterm=NONE guibg=#262626 guifg=#6c6c6c gui=NONE
hi! DiagnosticSignError guifg=red guibg=None
hi! DiagnosticSignWarn guifg=#b3b300 guibg=None
hi! DiagnosticSignInfo guifg=white guibg=None
hi! DiagnosticSignHint guifg=blue guibg=None

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword


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

highlight! MiniIndentscopeSymbol guifg=#404040

highlight! WinSeparator guifg=#505050
highlight! FzfLuaBorder guifg=#505050

highlight! link SnippetTabstop Normal
" Generated with RNB (https://github.com/romainl/vim-rnb)
