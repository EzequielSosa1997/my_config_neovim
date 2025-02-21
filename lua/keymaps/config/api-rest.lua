local okWich, with_key = pcall(require, "which-key")
local addCommand = require("keymaps.config.whitch-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>;", group = "REST" },
  { "<leader>;;", "<cmd>Rest run<cr>", desc = "REQUEST" },
  { "<leader>;l", "<cmd>Rest last<cr>", desc = "LAST REQUEST" },
  { "<leader>;f", group = "TELESCOPE" },
  { "<leader>;fe", "<cmd>lua require('telescope').extensions.rest.select_env()<cr>", desc = "Find ENV" },
}, { prefix = "<leader>" })
