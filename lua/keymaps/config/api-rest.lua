local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>;", group = "REST" },
  { "<leader>;;", "<cmd>lua require('kulala').run()<cr>", desc = "REQUEST" },
}, { prefix = "<leader>" })
