local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
	return
end

with_key.add({
  { "<leader>g", group = "GITSINGS" },  
  { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Prev line commit" },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Prev Hunk uncommit" },
  { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Prev toggle commit" },
}, { prefix = "<leader>" })
