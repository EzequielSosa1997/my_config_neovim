local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	g = {
		s = {
			name = "GITSINGS",
			t = { addCommand("Gitsigns toggle_current_line_blame"), "Prev line commit" },
			p = { addCommand("Gitsigns preview_hunk"), "Prev Hunk uncommit" },
			b = { addCommand("Gitsigns blame_line"), "Prev toggle commit" },
		},
	},
}, { prefix = "<leader>" })
