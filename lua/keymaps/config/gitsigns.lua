local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>G", group = "GITSINGS" },
  { "<leader>Gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Prev line commit" },
  { "<leader>Gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Prev Hunk uncommit" },
  { "<leader>Gb", "<cmd>Gitsigns blame_line<cr>", desc = "Prev toggle commit" },
}, { prefix = "<leader>" })
