local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	e = { addCommand("NeoTreeFloat"), "NEOTREE" },
}, { prefix = "<leader>" })
