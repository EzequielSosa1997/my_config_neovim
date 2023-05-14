local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	t = {
		name = "Terminal",
		n = { addCommand("lua _NODE_TOGGLE()"), "Node" },
		s = { addCommand("lua _TRANSESEN_TOGGLE()"), "Trans ES -> EN" },
		e = { addCommand("lua _TRANSENES_TOGGLE()"), "Trans EN -> ES" },
		f = { addCommand("ToggleTerm direction=float"), "Float" },
		t = { addCommand("ToggleTerm size=10 direction=horizontal"), "Horizontal" },
		v = { addCommand("ToggleTerm size=80 direction=vertical"), "Vertical" },
	},
}, { prefix = "<leader>" })
