local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	t = {
		name = "Terminal",
		n = { addCommand("lua _NODE_TOGGLE()"), "Node" },
		f = { addCommand("ToggleTerm direction=float"), "Float" },
		t = { addCommand("ToggleTerm size=10 direction=horizontal"), "Horizontal" },
		v = { addCommand("ToggleTerm size=80 direction=vertical"), "Vertical" },
	},
}, { prefix = "<leader>" })
