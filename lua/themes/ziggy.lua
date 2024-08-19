require("colorbuddy").colorscheme("ziggy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group

local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("primary", "#F27457")
Color.new("secondary", "#fbbf24")
Color.new("accent", "#9cca1b")
Color.new("tertiary", "#a8a29e")
Color.new("warning", "#ff33aa")
Color.new("focus", "#D6D58E")
Color.new("off", "#475569")
Color.new("line", "#2b4654")

local background_string = "#011813"

Color.new("background", background_string)
Color.new("background_dark", "#01140f")
Color.new("gray0", background_string)
Color.new("gray1", "#374151")
Color.new("gray2", "#6b7280")
Color.new("gray3", "#9ca3af")
Color.new("gray4", "#d1d5db")
Color.new("gray5", "#e5e7eb")

Color.new("slate0", "#0f172a")
Color.new("slate1", "#334155")
Color.new("slate2", "#0f172a")

-- editor
Group.new("Normal", c.gray5, c.background, s.none)
Group.new("Cursor", c.accent, c.gray3, s.none)
Group.new("CursorLine", nil, c.line:dark(), s.none)
Group.new("Visual", nil, c.line, s.none)
Group.new("VisualNOS", nil, c.line, s.none)
Group.new("Folded", nil, nil, s.bold)
Group.new("PmenuSel", nil, c.line, s.bold)
Group.new("Pmenu", c.gray5, c.background, s.none)

-- functions
Group.new("@constructor", c.focus, nil, s.italic)
Group.new("@lsp.type.method", c.focus, nil, s.italic)
Group.new("@function", c.focus, nil, s.italic)
Group.new("@function.method", c.focus, nil, s.italic)
Group.new("Function", c.focus, nil, s.italic)
Group.new("@function.builtin", c.focus, nil, s.italic)

Group.new("@property", c.tertiary)
Group.new("@member", c.tertiary)

Group.new("@type", c.secondary, nil, s.none)
Group.new("Type", c.secondary, nil, s.none)
Group.new("@module", c.secondary, nil, s.none)
Group.new("@type.builtin", c.secondary, nil, s.none)

Group.new("Special", c.primary, nil, s.bold)
Group.new("Statement", c.secondary, nil, s.none)

Group.new("@comment", c.off, nil, s.italic)

-- literals
Group.new("@number", c.secondary, nil, s.none)
Group.new("Number", c.secondary, nil, s.none)
Group.new("@string", c.accent:dark(), nil, s.italic)
Group.new("String", c.accent:dark(), nil, s.italic)

-- variables / constants
Group.new("@variable", c.gray5, nil)
Group.new("@variable.builtin", c.secondary, nil)
Group.new("@constant", c.accent, nil, s.none)
Group.new("@constant.builtin", c.accent, nil, s.none)

Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@punctuation.bracket", g.Normal, nil)
Group.new("Keyword", c.primary, nil, s.none)
Group.new("@keyword", c.primary, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.bold)

Group.new("WinBar", c.background:light():light(), nil, s.none)
Group.new("WinBarNC", c.background:light(), nil, s.none)
Group.new("WinBarSep", c.background:light(), nil, s.none)
Group.new("StatuslineMode", c.gray5, c.background:light():light(), s.none)
Group.new("StatuslineModeSeparator", c.background:light():light())
Group.new("StatusLine", c.gray5, nil, s.none)
Group.new("StatusLineNC", c.gray5:dark(), nil, s.none)
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
Group.new("TodoFgNote", c.tertiary:light():light(), nil, s.italic)

Group.new("TodoBgTODO", c.gray0, c.accent, s.bold)
Group.new("TodoBgFIX", c.gray0, c.warning:dark(), s.bold)
Group.new("TodoBgNote", c.gray0, c.tertiary:light():light(), s.bold)

Group.new("MiniIndentscopeSymbol", c.off, nil, s.none)
