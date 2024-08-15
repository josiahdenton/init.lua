require("colorbuddy").colorscheme("ziggy")

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local Group = colorbuddy.Group

local c = colorbuddy.colors
local g = colorbuddy.groups
local s = colorbuddy.styles

Color.new("primary", "#F27457")
Color.new("accent", "#9cca1b") --
Color.new("secondary", "#fbbf24")
Color.new("tertiary", "#3386b3") -- alt #D6D58E
Color.new("warning", "#ff33aa")

-- local background_string = "#111111"
-- local background_string = "#030712"
local background_string = "#0c0a09"

Color.new("background", background_string)
-- Color.new("gray0", background_string)
Color.new("gray1", "#374151")
Color.new("gray2", "#6b7280")
Color.new("gray3", "#9ca3af")
Color.new("gray4", "#d1d5db")
Color.new("gray5", "#f3f4f6")

Color.new("slate0", "#0f172a")
Color.new("slate1", "#334155")
Color.new("slate2", "#0f172a")

-- editor
Group.new("Normal", c.gray5, c.background, s.none)
Group.new("Cursor", c.accent, c.gray3, s.none)
Group.new("CursorLine", nil, c.background:light(), s.none)
Group.new("Visual", nil, c.background:light():light(), s.none)
Group.new("VisualNOS", nil, c.background:light():light(), s.none)

-- functions
Group.new("@constructor", c.gray4, nil, s.italic)
Group.new("@lsp.type.method", c.gray4, nil, s.italic)
Group.new("@function", c.gray4, nil, s.italic)
Group.new("@function.method", c.gray4, nil, s.italic)
Group.new("Function", c.gray4, nil, s.italic)
Group.new("@function.builtin", c.secondary, nil, s.italic)

Group.new("@property", c.gray3)
Group.new("@tag.builtin", c.secondary)
Group.new("@tag.attribute", c.primary)

Group.new("@type", c.secondary, nil, s.none)
Group.new("Type", c.secondary, nil, s.none)
Group.new("@module", c.secondary, nil, s.none)
Group.new("@type.builtin", c.secondary, nil, s.none)

Group.new("Special", c.primary, nil, s.bold)
Group.new("Statement", c.secondary, nil, s.none)

-- literals
Group.new("@number", c.secondary, nil, s.none)
Group.new("Number", c.secondary, nil, s.none)
Group.new("@string", c.accent, nil, s.italic)
Group.new("String", c.accent, nil, s.italic)

-- variables / constants
Group.new("@variable", c.gray5, nil)
Group.new("@variable.builtin", c.secondary, g.Normal)
Group.new("@constant", c.accent, nil, s.none)
Group.new("@constant.builtin", c.accent, nil, s.none)

Group.new("@function.bracket", g.Normal, g.Normal)
Group.new("@punctuation.bracket", g.Normal, nil)
Group.new("Keyword", c.primary, nil, s.none)
Group.new("@keyword", c.primary, nil, s.none)
Group.new("@keyword.faded", g.nontext.fg:light(), nil, s.bold)

Group.new("StatusLine", c.gray5, c.slate1, s.none)
Group.new("StatusLineNC", c.gray5:dark(), c.slate2, s.none)
-- Group.new("@variable", c.superwhite, nil)
Group.new("FloatBorder", c.gray3, nil, s.none)

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
Group.new("TodoBgTODO", c.gray1, c.accent, s.bold)
Group.new("TodoBgFIX", c.gray1, c.warning:dark(), s.bold)
Group.new("TodoBgNote", c.gray1, c.tertiary:light():light(), s.bold)

