local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>f", group = "Telescope" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find file" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "find help" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "find live grep" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
}, { prefix = "<leader>" })
