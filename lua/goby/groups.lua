local M = {}

M.colors = {
	bg            =  "#f0f0f0",
	fg            =  "#252519",
	comment       =  "#408080",
	keyword       =  "#954121",
	number        =  "#666666",
	string        =  "#219161",
	type          =  "#B00040",
	visual        =  "#555555",
	search        =  '#7faeff',

	bg_dark       =  "#181a1b",
	fg_dark       =  "#d4d1cb",
	comment_dark  =  "#83c1c1",
	keyword_dark  =  "#df8c6d",
	number_dark   =  "#a8a095",
	string_dark   =  "#70deaf",
	type_dark     =  "#ff5190",
	visual_dark   =  "#202325",
	search_dark   =  '#7faeff',

	gray          =  "#999999",

	-- unused (these were found in the CSS file on gobyexample.com)
	red           =  "#FF0000",
	red_dark      =  "#A00000",
	green         =  "#00A000",
	blue          =  "#0040D0",
	blue_dark     =  "#19469D",
	blue_darker   =  "#000080",
	magenta       =  "#AA22FF",
	olive         =  "#7D9029",
	yellow        =  "#ffffcc",
}

M.setup = function()
	local colors = M.colors
	local config = require("goby").config

	-- Defaults to `light` mode
	colors.background  =  colors.bg
	colors.foreground  =  colors.fg

	if vim.o.background == 'dark' then
		colors.background  =  colors.bg_dark
		colors.foreground  =  colors.fg_dark
		colors.comment     =  colors.comment_dark
		colors.keyword     =  colors.keyword_dark
		colors.number      =  colors.number_dark
		colors.string      =  colors.string_dark
		colors.type        =  colors.type_dark
		colors.visual      =  colors.visual_dark
		colors.search      =  colors.search_dark
	end

	if config.transparent then
		colors.background = "NONE"
	end

	local groups = {

		Normal = { bg = colors.background, fg = colors.foreground },
		NormalFloat = { link = "Normal" },
		NonText = { link = "Normal" },
		SignColumn = { link = "Normal" },

		StatusLine = { bg = colors.background, fg = colors.foreground },
		StatusLineNC = { bg = colors.background, fg = colors.number },

		Visual = { bg = colors.visual },
		Cursor = { bg = colors.foreground },

		MatchParen = { bg = colors.gray, fg = colors.visual },
		CursorLine = { bg = colors.visual, fg = colors.foreground },

		Folded     = { bg = colors.visual, fg = colors.comment },
		FoldColumn = { bg = colors.gray, fg = colors.comment },

		ColorColumn = { bg = colors.visual },
		LineNrAbove = { fg = colors.gray },
		LineNrBelow = { fg = colors.gray },
		LineNr = { fg = colors.foreground },

		Comment = { fg = colors.comment, italic = config.italics },

		String = { fg = colors.string },
		Character = { fg = colors.string },
		Special = { fg = colors.string },

		Type = { fg = colors.type },

		Boolean = { fg = colors.keyword },
		Identifier = { fg = colors.foreground },
		Constant = { fg = colors.foreground },
		Repeat = { fg = colors.foreground },
		Exception = { fg = colors.foreground },
		Typedef = { fg = colors.foreground },
		Structure = { fg = colors.foreground },
		StorageClass = { fg = colors.foreground },

		goBuiltins = { fg = colors.keyword },
		Conditional = { fg = colors.keyword },
		Keyword = { fg = colors.keyword },
		Statement = { fg = colors.keyword },
		Function = { fg = colors.keyword },
		PreProc = { fg = colors.keyword },

		Number = { fg = colors.number },
		Float = { link = "Number" },
		Operator = { link = "Number" },
		goBlock = { link = "Number" },

		Todo = { fg = colors.foreground },

		Error = { fg = colors.type },
		ErrorMsg = { fg = colors.foreground },
		WarningMsg = { fg = colors.foreground },
		Title = { fg = colors.keyword },
		Question = { fg = colors.foreground },

		Pmenu = { bg = colors.background, fg = colors.foreground },
		PmenuSel = { bg = colors.visual, fg = colors.foreground },
		PmenuThumb = { link = "Pmenu" },

		Search = { bg = colors.search, fg = colors.bg_dark },
		IncSearch = { bg = colors.search, fg = colors.bg_dark },

		EndOfBuffer = { fg = colors.background },

		TermCursor = { link = "Cursor" },
		TermCursorNC = { link = "Cursor" },

		netrwBak = { fg = colors.foreground },
		Directory = { fg = colors.foreground },
		netrwDir = { fg = colors.foreground },
		netrwExe = { fg = colors.foreground },
		netrwLink = { fg = colors.foreground },
		netrwClassify = { fg = colors.foreground },
		netrwSymLink = { fg = colors.string },

		DiagnosticError = { fg = colors.foreground },
		DiagnosticWarn = { fg = colors.foreground },
		DiagnosticInfo = { fg = colors.foreground },

		DiffText = { link = "Normal" },
		DiffDelete = { fg = colors.type },
		DiffAdd = { fg = colors.string },
		DiffChange = { fg = colors.keyword },

		SpellBad = { underline = true },
		SpellCap = { underline = true },
		SpellRare = { underline = true },
		SpellLocal = { underline = true },

		TabLine = { link = "Normal" },
		TabLineFill = { link = "Normal" },
		TabLineSel = { bg = colors.visual, fg = colors.foreground },

		QuickFixLine = { link = "Visual" },

		-- fugitive.nvim
		diffAdded = { link = "DiffAdd" },
		diffRemoved = { link = "DiffDelete" },

		-- html
		htmlLink = { fg = colors.type },
		htmlTag = { fg = colors.type },
		htmlTagName = { fg = colors.foreground },

		-- xml
		xmlTag = { link = "Normal" },

		--json
		jsonBraces = { link = "Normal" },

		-- markdown
		markdownBlockquote = { fg = colors.comment },
		markdownUrl = { fg = colors.type },

		-- tree sitter
		["@constant.builtin"] = { link = "Keyword" },
		["@constructor"] = { link = "Normal" },
		["@function"] = { link = "Normal" },
		["@function.builtin"] = { link = "Keyword" },
		["@method"] = { link = "Normal" },
		["@punctuation"] = { link = "Normal" },
		["@type.go"] = { link = "Normal" },
		["@field.go"] = { link = "Normal" },

		-- health check
		Conceal = { link = "Normal" },
		healthHeadingChar = { link = "Normal" },
		helpSectionDelim = { link = "healthHeadingChar" },

		NotificationInfo = { fg = colors.foreground, bg = colors.background },
		NotificationError = { fg = colors.type, bg = colors.background },
		NotificationWarning = { fg = colors.keyword, bg = colors.background },
	}

	return groups
end

return M
