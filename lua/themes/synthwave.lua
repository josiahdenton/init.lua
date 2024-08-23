require("colorbuddy").colorscheme("synthwave")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group

local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

-- #FF6C11
-- #FF3864
-- #2DE2E6
-- #261447
-- #0D0221
-- #023788
-- #650D89
-- #920075
-- #F6019D
-- #D40078
-- #241734
-- #2E2157
-- #FD3777
-- #F706CF
-- #FD1D53
-- #F9C80E
-- #FF4365
-- #540D6E
-- #791E94
-- #541388
-- base04 = "#37474F", base05 = "#90A4AE", base06 = "#525252", base07 = "#08bdba", base08 = "#ff7eb6", base09 = "#ee5396", base10 = "#FF6F00", base11 = "#0f62fe", base12 = "#673AB7", base13 = "#42be65", base14 = "#be95ff", base15 = "#FFAB91", blend = "#FAFAFA", none = "NONE"})

-- #42be65
-- #FFAB91

Color.new("primary", "#ff7eb6")
Color.new("secondary", "#69c2f1") -- #0f62fe / #08bdba / #08bdec / #0864ec
Color.new("accent", "#be95ff")
Color.new("tertiary", "#FF4365")
Color.new("warning", "#ff33aa")
Color.new("focus", "#08bdba")
Color.new("off", "#475569")
Color.new("line", "#08435E")

local background_string = "#06101e"

Color.new("background", background_string)
Color.new("background_dark", "#01140f")
Color.new("gray0", background_string)
Color.new("gray1", "#374151")
Color.new("gray2", "#6b7280")
Color.new("gray3", "#9ca3af")
Color.new("gray4", "#d1d5db")
Color.new("gray5", "#FAFAFA")

Color.new("slate0", "#0f172a")
Color.new("slate1", "#334155")
Color.new("slate2", "#0f172a")

-- editor
Group.new("Normal", c.gray5, c.background, s.none)
Group.new("Cursor", c.accent, c.gray3, s.none)
Group.new("CursorLine", nil, c.line:dark(), s.none)
Group.new("TermCursor", nil, c.gray3, s.none)
Group.new("TermCursorNC", nil, c.gray1, s.none)
Group.new("Visual", nil, c.line, s.none)
Group.new("VisualNOS", nil, c.line, s.none)
Group.new("Folded", nil, nil, s.bold)
Group.new("PmenuSel", nil, c.line, s.bold)
Group.new("Pmenu", c.gray5, c.background, s.none)

-- functions
Group.new("@constructor", c.primary, nil, s.bold)
Group.new("@lsp.type.method", c.primary, nil, s.bold)
Group.new("@function", c.primary, nil, s.bold)
Group.new("@function.method", c.primary, nil, s.bold)
Group.new("Function", c.primary, nil, s.bold)
Group.new("@function.builtin", c.primary, nil, s.bold)

Group.new("@property", c.primary)
Group.new("@member", c.primary)

Group.new("@type", c.secondary, nil, s.none)
Group.new("Type", c.secondary, nil, s.none)
Group.new("@module", c.secondary, nil, s.none)
Group.new("PreProc", c.primary, nil, s.none)
Group.new("@type.builtin", c.secondary, nil, s.none)

Group.new("Special", c.primary, nil, s.bold)
Group.new("Statement", c.secondary, nil, s.none)
Group.new("@punctuation.delimiter", c.tertiary, nil, s.bold)
Group.new("Delimiter", c.tertiary, nil, s.bold)

Group.new("@comment", c.off:light(), nil, s.italic)

-- literals
Group.new("@number", c.secondary, nil, s.none)
Group.new("Number", c.secondary, nil, s.none)
Group.new("@string", c.accent, nil, s.italic)
Group.new("String", c.accent, nil, s.italic)

-- variables / constants
Group.new("@variable", c.gray5, nil)
Group.new("@variable.builtin", c.secondary, nil)
Group.new("@constant", c.accent, nil, s.none)
Group.new("@constant.builtin", c.accent:dark(), nil, s.none)

Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@punctuation.bracket", g.Normal, nil)
Group.new("Keyword", c.focus, nil, s.none)
Group.new("@keyword", c.focus, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.bold)

-- vim.api.nvim_set_hl(0, "VertSplit", {link = "WinSeparator"})
-- vim.api.nvim_set_hl(0, "WinSeparator", {fg = oxocarbon.base01, bg = oxocarbon.base00})

Group.new("WinBar", c.primary, nil, s.none)
Group.new("WinBarNC", c.primary, nil, s.none)
Group.new("WinBarSep", c.primary, nil, s.none)
Group.new("StatuslineMode", c.gray5, c.primary:dark(), s.bold)
Group.new("StatuslineModeSeparator", c.primary:dark())
Group.new("StatusLine", c.gray5, nil, s.none)
Group.new("StatusLineNC", c.gray5:dark(), c.none, s.none)
-- Group.new("@variable", c.superwhite, nil)
Group.new("FloatBorder", c.gray3, nil, s.none)

-- languages

-- html
Group.new("Tag", c.secondary)
Group.new("@tag.builtin", c.secondary)
Group.new("@tag.attribute", c.primary)

-- plugins

-- trouble
Group.new("TroubleNormal", c.gray2, nil, s.none)
Group.new("TroubleNormalNC", c.gray2, nil, s.none)

-- todo comments
-- TODO:
-- FIXME:
-- NOTE:
-- TODO:
-- HACK:
-- WARN:
-- PERF:
-- NOTE:
-- TEST:

Group.new("TodoFgTODO", c.accent, nil, s.italic)
Group.new("TodoFgFIX", c.warning:dark(), nil, s.italic)
Group.new("TodoFgNote", c.gray5:light():light(), nil, s.italic)

Group.new("TodoBgTODO", c.gray0, c.accent, s.bold)
Group.new("TodoBgFIX", c.gray0, c.warning:dark(), s.bold)
Group.new("TodoBgNote", c.gray0, c.gray5:light():light(), s.bold)

Group.new("MiniIndentscopeSymbol", c.off, nil, s.none)
