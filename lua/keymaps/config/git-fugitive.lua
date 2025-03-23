local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>g", group = "GIT" }, -- Grupo principal GIT
  { "<leader>gg", "<cmd>G<cr>", desc = "Open menu" },
  { "<leader>gp", "<cmd>G push<cr>", desc = "Git push" },
  { "<leader>gl", "<cmd>G pull<cr>", desc = "Git pull" },

  { "<leader>gf", group = "TELESCOPE" }, -- Subgrupo TELESCOPE
  { "<leader>gfc", "<cmd>Telescope git_commits<cr>", desc = "Find Commits" },
  { "<leader>gfb", "<cmd>Telescope git_branches<cr>", desc = "Find Branches" },
  { "<leader>gff", "<cmd>Telescope git_files<cr>", desc = "Find Files to Git" },
  { "<leader>gfs", "<cmd>Telescope git_status<cr>", desc = "Find Files modify" },
}, { prefix = "<leader>" })
