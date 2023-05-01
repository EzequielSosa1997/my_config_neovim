local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	u = {
		name = "UNDOTREE",
		a = { addCommand("UndotreeShow") .. addCommand("UndotreeFocus"), "Open menu undo" },
	},
}, { prefix = "<leader>" })
