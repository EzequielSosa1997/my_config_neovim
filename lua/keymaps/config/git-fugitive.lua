local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.register({
	g = {
		name = "GIT",
		g = { addCommand("G"), "Open menu" },
		p = { addCommand("G push"), "Git push" },
		l = { addCommand("G push"), "Git pull" },
		f = {
			name = "MORE OPTIONS",
			c = { addCommand("Telescope git_commits"), "Find Commits" },
			b = { addCommand("Telescope git_branches"), "Find Branches" },
			f = { addCommand("Telescope git_files"), "Find Files to Git" },
			s = { addCommand("Telescope git_status"), "Find Files modify" },
		},
	},
}, { prefix = "<leader>" })
