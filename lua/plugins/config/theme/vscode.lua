local _color, color = pcall(require, "vscode.colors")
local _vscode, code = pcall(require, "vscode")

if not _color or not _vscode then
	return
end
vim.o.background = "dark"

color.get_colors()
code.setup({

	transparent = false,

	italic_comments = true,

	disable_nvimtree_bg = false,

	color_overrides = {
		vscLineNumber = "#FFFFFF",
	},

	group_overrides = {

		Cursor = { fg = code.vscDarkBlue, bg = code.vscLightGreen, bold = true },
	},
})
code.load()
