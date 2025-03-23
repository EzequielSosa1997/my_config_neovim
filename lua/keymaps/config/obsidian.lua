local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({})

with_key.add({
  { "<leader>o", group = "Obsidian" },
  { "<leader>oo", "<cmd>ObsidianNew<cr>", desc = "Open Note" },
  { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Open Note Today" },
  { "<leader>ow", group = "Workspace" },
  { "<leader>owa", "<cmd>ObsidianWorkspace activar_v2<cr>", desc = "activar_v2" },
  { "<leader>own", "<cmd>ObsidianWorkspace notes<cr>", desc = "notes" },
}, { prefix = "<leader>" })
