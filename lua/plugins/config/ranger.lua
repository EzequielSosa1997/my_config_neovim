vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_edit_cmd = "drop"
vim.g.rnvimr_draw_border = 0
vim.g.rnvimr_hide_gitignore = 0
vim.g.rnvimr_enable_bw = 1

vim.g.rnvimr_action = {
	["<C-t>"] = "NvimEdit tabedit",
	["<C-x>"] = "NvimEdit split",
	["<C-v>"] = "NvimEdit vsplit",
	["gw"] = "JumpNvimCwd",
	["yw"] = "EmitRangerCwd",
}

vim.g.rnvimr_border_attr = {
	fg = 14,
	bg = -1,
}

vim.g.rnvimr_ranger_cmd = { "ranger", "--cmd=set draw_borders both" }

vim.cmd("highlight link RnvimrNormal CursorLine")

vim.g.rnvimr_ranger_views = {
	{ minwidth = 100, ratio = {} },
	{ minwidth = 100, maxwidth = 100, ratio = { 1, 1 } },
	{ maxwidth = 49, ratio = { 1 } },
}

vim.g.rnvimr_layout = {
	relative = "editor",
	width = vim.o.columns,
	height = vim.o.lines - 2,
	col = 0,
	row = 0,
	style = "minimal",
}
