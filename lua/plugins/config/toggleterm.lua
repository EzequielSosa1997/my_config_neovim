local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
	return
end

toggleterm.setup({
	size = 10,
	open_mapping = [[<C-\>]],
	insert_mappings = false,
	shading_factor = 2,
	shade_filetypes = {},
	shade_terminals = true,
	persist_size = false,
	start_in_insert = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end
