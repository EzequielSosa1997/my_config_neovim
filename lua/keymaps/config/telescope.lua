local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	f = {
		name = "TELESCOPE",
		f = { addCommand("Telescope find_files"), "find file" },
		h = { addCommand("Telescope help_tags"), "find help" },
		g = { addCommand("Telescope live_grep"), "find live grep" },
		b = { addCommand("Telescope buffers"), "find buffers" },
	},
}, { prefix = "<leader>" })
