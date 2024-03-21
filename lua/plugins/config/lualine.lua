local ok, lualine = pcall(require, "lualine")
local theme = require("plugins.config.theme")

if not ok then
	return
end

local function line_count()
	return vim.api.nvim_buf_line_count(0)
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "┃", right = "┃" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"alpha",
				"lir",
				"Outline",
				"spectre_panel",
				"toggleterm",
			},
		},
		-- ignore_focus = {},
		-- always_divide_middle = true,
		-- globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "branch" },
		lualine_b = { { "diff", icon = "" }, "diagnostics" },
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = {
			"fileformat",
			{ "os.date('%H:%M %a %B %y')" },
			{ "filesize" },
			"location",
			"progress",
			{ line_count, icon = "﬘" },
			"mode",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree" },
})
