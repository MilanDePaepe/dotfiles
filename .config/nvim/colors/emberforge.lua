-- emberforge.lua: Neovim Lua colorscheme

-- tell Neovim the name of this colorscheme
vim.g.colors_name = "emberforge"

-- color palette
local c = {
	-- Backgrounds
	background = "#121212",

	-- Grayscale
	g_0 = "#e5e5e5",
	g_1 = "#e5e5e5",
	g_2 = "#d5d5d5",
	g_3 = "#b4b4b4",
	g_4 = "#a7a7a7",
	g_5 = "#949494",
	g_6 = "#737373",
	g_7 = "#535353",
	g_8 = "#323232",
	g_9 = "#212121",
	g_10 = "#1d1d1d",
	g_11 = "#191919",
	g_12 = "#151515",

	-- Reds
	red_flame = "#C53030",
	red_glowing = "#DF6464",
	red_ember = "#B14242",
	red_kindling = "#BD4C4C",
	red_burnt_crimson = "#A84848",
	red_brick = "#853D3D",
	red_deep_ember = "#7A2E2E",
	red_ashen = "#6F2929",

	-- Oranges
	orange_glow = "#D87C4A",
	orange_blaze = "#C4693D",
	orange_smolder = "#E49A44",
	orange_golden = "#E5A72A",

	-- Other colors
	blue = "#4A8B8B",
	blue_dark = "#3A6E6E",
	green_light = "#629C7D",
	green = "#1E6F54",
	yellow = "#F4CA64",
	purple = "#7A3D82",
	pink = "#D1728C",
	brown = "#853D3D",
	black = "#121212",
	white = "#FFFFFF",
	gray = "#A7A7A7",
	cyan = "#6E91C4",
	magenta = "#C9347C",
	lime = "#8CD437",
	teal = "#1A3F3F",
	navy = "#223A70",
	maroon = "#7A2E2E",
	olive = "#708238",
	indigo = "#502E5F",
	violet = "#8E5E93",
	gold = "#D7A933",
	silver = "#D5D5D5",
	beige = "#F5F5DC",
	aqua = "#4AC4C4",
	coral = "#E492B4",
}

-- helper for setting highlights
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Basic editor UI
hl("Normal", { fg = c.g_0, bg = c.background })
hl("CursorLine", { bg = c.g_11 })
hl("CursorColumn", { bg = c.g_11 })
hl("Visual", { bg = c.g_9 })
hl("LineNr", { fg = c.g_7 })
hl("CursorLineNr", { fg = c.g_0 })
hl("VertSplit", { fg = c.g_8 })
hl("WinSeparator", { fg = c.g_8 })
hl("StatusLine", { fg = c.g_0, bg = c.g_9 })
hl("StatusLineNC", { fg = c.g_5, bg = c.g_10 })
hl("NormalFloat", { fg = c.g_0, bg = c.g_11 })

-- Search
hl("Search", { fg = c.background, bg = c.yellow })
hl("IncSearch", { fg = c.background, bg = c.orange_glow })

-- Syntax
hl("Comment", { fg = c.g_7, italic = true })
hl("Constant", { fg = c.orange_smolder })
hl("String", { fg = c.green_light })
hl("Character", { fg = c.green_light })
hl("Number", { fg = c.orange_glow })
hl("Boolean", { fg = c.orange_glow })
hl("Identifier", { fg = c.blue })
hl("Function", { fg = c.orange_glow })
hl("Statement", { fg = c.red_glowing })
hl("Conditional", { fg = c.red_glowing })
hl("Repeat", { fg = c.red_glowing })
hl("Keyword", { fg = c.red_flame })
hl("Operator", { fg = c.g_0 })
hl("Type", { fg = c.red_ember })
hl("Special", { fg = c.orange_glow })

-- LSP / diagnostics
hl("DiagnosticError", { fg = c.red_flame })
hl("DiagnosticWarn", { fg = c.orange_golden })
hl("DiagnosticInfo", { fg = c.blue })
hl("DiagnosticHint", { fg = c.green_light })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red_flame })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange_golden })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = c.green_light })

-- Diff
hl("DiffAdd", { fg = c.green_light, bg = c.g_10 })
hl("DiffChange", { fg = c.blue, bg = c.g_10 })
hl("DiffDelete", { fg = c.red_flame, bg = c.g_10 })
hl("DiffText", { fg = c.orange_glow, bg = c.g_10 })

-- Popup menu
hl("Pmenu", { fg = c.g_0, bg = c.g_9 })
hl("PmenuSel", { fg = c.background, bg = c.blue })
hl("PmenuSbar", { bg = c.g_9 })
hl("PmenuThumb", { bg = c.g_7 })

-- Telescope (optional)
hl("TelescopeBorder", { fg = c.g_8 })
hl("TelescopeSelection", { bg = c.g_9 })

-- Neotree highlights
-- Neotree red accents
hl("NeoTreeGitAdded", { fg = c.red_ember }) -- green changed to red
hl("NeoTreeGitModified", { fg = c.red_glowing }) -- orange changed to red
hl("NeoTreeGitDeleted", { fg = c.red_flame })
hl("NeoTreeNormal", { fg = c.g_0, bg = c.background })
hl("NeoTreeNormalNC", { fg = c.g_7, bg = c.background })
hl("NeoTreeCursorLine", { bg = c.g_10 })
hl("NeoTreeFloatBorder", { fg = c.g_7 })
hl("NeoTreeFloatTitle", { fg = c.g_0, bold = true })
hl("NeoTreeDirectoryName", { fg = c.red_ember })
hl("NeoTreeDirectoryIcon", { fg = c.red_flame })
hl("NeoTreeFileName", { fg = c.g_0 })
