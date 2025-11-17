-- colors/neolabaster.lua
-- Alabaster-inspired light theme (constant fg, background-tinted syntax)
-- No portability checks; requires termguicolors.

local c = {
  -- base
  fg = "#444444",
  bg = "#f8f8f8",
  bg_dim = "#f2f2f2",

  -- syntax tints (backgrounds)
  comment = "#ebebeb",
  string = "#e3f4df",
  keyword = "#e3edf9",
  func = "#ece4fa",
  constant = "#f8ebd9",
  type = "#eef8fa",
  number = "#f6f0eb",
  operator = "#f3f3f3",
  visual = "#e0e0e0",

  -- diagnostics (more visible)
  error = "#fceaea",
  warn = "#fff3d6",
  info = "#eaf3ff",
  hint = "#edf9ed",
}

local hl = vim.api.nvim_set_hl

-- Core
hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NonText", { fg = "#bfbfbf", bg = c.bg })
hl(0, "EndOfBuffer", { fg = "#e6e6e6", bg = c.bg })
hl(0, "Cursor", { fg = c.bg, bg = c.fg })
hl(0, "CursorLine", { bg = c.bg_dim })
hl(0, "CursorColumn", { bg = c.bg_dim })
hl(0, "CursorLineNr", { fg = "#333333", bg = c.bg_dim })
hl(0, "LineNr", { fg = "#999999", bg = c.bg })
hl(0, "ColorColumn", { bg = "#f4f4f4" })
hl(0, "Visual", { fg = c.fg, bg = c.visual })
hl(0, "VisualNOS", { fg = c.fg, bg = c.visual })
hl(0, "SignColumn", { bg = c.bg })
hl(0, "VertSplit", { fg = "#e3e3e3", bg = c.bg })
hl(0, "StatusLine", { fg = c.fg, bg = c.bg_dim })
hl(0, "StatusLineNC", { fg = "#777777", bg = c.bg })
hl(0, "Title", { fg = c.fg, bg = c.bg, bold = true })
hl(0, "SpecialKey", { fg = "#7f7f7f", bg = c.bg })
hl(0, "Pmenu", { fg = c.fg, bg = c.bg })
hl(0, "PmenuSel", { fg = c.fg, bg = c.bg_dim })
hl(0, "PmenuSbar", { fg = c.fg, bg = c.bg })
hl(0, "PmenuThumb", { fg = c.fg, bg = c.bg_dim })
hl(0, "WildMenu", { fg = c.fg, bg = c.bg_dim })
hl(0, "Search", { fg = c.fg, bg = "#fff1b8" })
hl(0, "IncSearch", { fg = c.fg, bg = "#ffe08a" })
hl(0, "MatchParen", { fg = c.fg, bg = "#e6f0ff", bold = true })

-- Basic syntax (constant foreground, tinted backgrounds)
hl(0, "Comment", { fg = c.fg, bg = c.comment, italic = true })
hl(0, "Constant", { fg = c.fg, bg = c.constant })
hl(0, "String", { fg = c.fg, bg = c.string })
hl(0, "Character", { fg = c.fg, bg = c.string })
hl(0, "Number", { fg = c.fg, bg = c.number })
hl(0, "Boolean", { fg = c.fg, bg = c.constant })
hl(0, "Identifier", { fg = c.fg, bg = c.bg }) -- keep plain
hl(0, "Function", { fg = c.fg, bg = c.func })
hl(0, "Statement", { fg = c.fg, bg = c.keyword })
hl(0, "Keyword", { fg = c.fg, bg = c.keyword, bold = true })
hl(0, "PreProc", { fg = c.fg, bg = c.keyword })
hl(0, "Type", { fg = c.fg, bg = c.type })
hl(0, "StorageClass", { fg = c.fg, bg = c.type })
hl(0, "Structure", { fg = c.fg, bg = c.bg })
hl(0, "Macro", { fg = c.fg, bg = c.keyword })
hl(0, "Special", { fg = c.fg, bg = c.operator })
hl(0, "SpecialChar", { fg = c.fg, bg = c.operator })
hl(0, "Tag", { fg = c.fg, bg = c.keyword })
hl(0, "Delimiter", { fg = c.fg, bg = c.operator })
hl(0, "Operator", { fg = c.fg, bg = c.operator, bold = false })

-- UI / misc
hl(0, "Directory", { fg = c.fg, bg = c.bg })
hl(0, "Question", { fg = c.fg, bg = c.bg })
hl(0, "MoreMsg", { fg = c.fg, bg = c.bg })
hl(0, "ModeMsg", { fg = c.fg, bg = c.bg })
hl(0, "WarningMsg", { fg = c.fg, bg = c.warn })
hl(0, "ErrorMsg", { fg = c.fg, bg = c.error, bold = true })

-- Diff
hl(0, "DiffAdd", { fg = c.fg, bg = c.string })
hl(0, "DiffChange", { fg = c.fg, bg = c.keyword })
hl(0, "DiffDelete", { fg = c.fg, bg = c.error })
hl(0, "DiffText", { fg = c.fg, bg = c.bg_dim })

-- Spell / marks
hl(0, "SpellBad", { undercurl = true, sp = "#c94a4a" })
hl(0, "SpellCap", { undercurl = true, sp = "#c08a00" })
hl(0, "SpellLocal", { undercurl = true, sp = "#3a7bd5" })
hl(0, "SpellRare", { undercurl = true, sp = "#6b6bd6" })

-- Popup / floating windows
-- IMPORTANT: background for borders must match Normal so only border chars are visible
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg })
hl(0, "FloatBorder", { fg = c.fg, bg = c.bg }) -- border bg same as Normal
hl(0, "FloatTitle", { fg = c.fg, bg = c.bg_dim, bold = true })

-- Completion / CMP / Pmenu / popup related
hl(0, "Pmenu", { fg = c.fg, bg = c.bg })
hl(0, "PmenuSel", { fg = c.fg, bg = c.bg_dim })
hl(0, "PmenuThumb", { fg = c.fg, bg = c.bg_dim })
hl(0, "PmenuSbar", { fg = c.fg, bg = c.bg })
hl(0, "WildMenu", { fg = c.fg, bg = c.bg_dim })

-- some commonly used popup borders from plugins (make their border bg same as Normal)
hl(0, "CmpDocBorder", { fg = c.fg, bg = c.bg })
hl(0, "CmpItemKind", { fg = c.fg, bg = c.bg })

-- Diagnostics (LSP) - virtual text / signs / underlines
hl(0, "DiagnosticSignError", { fg = "#b23a3a", bg = c.error })
hl(0, "DiagnosticSignWarn", { fg = "#9a7b00", bg = c.warn })
hl(0, "DiagnosticSignInfo", { fg = "#3b6fb8", bg = c.info })
hl(0, "DiagnosticSignHint", { fg = "#2f7a3f", bg = c.hint })

hl(0, "DiagnosticError", { fg = c.fg, bg = c.error })
hl(0, "DiagnosticWarn",  { fg = c.fg, bg = c.warn })
hl(0, "DiagnosticInfo",  { fg = c.fg, bg = c.info })
hl(0, "DiagnosticHint",  { fg = c.fg, bg = c.hint })

hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#b23a3a" })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#9a7b00" })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#3b6fb8" })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#2f7a3f" })

-- LSP-related highlights
hl(0, "LspReferenceText", { fg = c.fg, bg = c.bg_dim })
hl(0, "LspReferenceRead", { fg = c.fg, bg = c.bg_dim })
hl(0, "LspReferenceWrite", { fg = c.fg, bg = c.bg_dim })
hl(0, "LspCodeLens", { fg = "#8a8a8a", bg = c.bg })
hl(0, "LspInfoBorder", { fg = c.fg, bg = c.bg })

-- Git / gutter signs (common plugin groups)
hl(0, "DiffAdd", { fg = c.fg, bg = c.string })
hl(0, "DiffDelete", { fg = c.fg, bg = c.error })
hl(0,"GitSignsChange", {fg = "#b392f0", bg = c.bg_dim})

-- Markdown / help
hl(0, "MarkdownHeading", { fg = c.fg, bg = c.bg_dim, bold = true })
hl(0, "markdownH1", { fg = c.fg, bg = c.bg_dim, bold = true })
hl(0, "markdownH2", { fg = c.fg, bg = c.bg_dim, bold = true })
hl(0, "helpNormal", { fg = c.fg, bg = c.bg })
hl(0, "helpLeadBlank", { fg = c.fg, bg = c.bg })

-- Tabs / Buttons
hl(0, "TabLine", { fg = "#7f7f7f", bg = c.bg })
hl(0, "TabLineSel", { fg = c.fg, bg = c.bg_dim })
hl(0, "Button", { fg = c.fg, bg = c.bg_dim })

-- Misc / Others (safe defaults)
hl(0, "Error", { fg = c.fg, bg = c.error })
hl(0, "Todo", { fg = c.fg, bg = "#fff6e6", bold = true })
hl(0, "SpecialComment", { fg = c.fg, bg = c.comment })

-- Keep 'clear' and 'link' inert (some vimscript files include these tokens)
hl(0, "clear", { fg = c.fg, bg = c.bg })
hl(0, "link", { fg = c.fg, bg = c.bg })

-- End of theme
