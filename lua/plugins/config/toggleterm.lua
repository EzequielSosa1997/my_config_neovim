local ok, toggleterm = pcall(require, "toggleterm")

if not ok then
	return
end

toggleterm.setup({
	size = 12,
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
local transEsEn = Terminal:new({ cmd = "transESEN", hidden = true })

local transEnEs = Terminal:new({ cmd = "transENES", hidden = true })
function _NODE_TOGGLE()
	node:toggle()
end

function _TRANSESEN_TOGGLE()
	transEsEn:toggle()
end

function _TRANSENES_TOGGLE()
	transEnEs:toggle()
end
