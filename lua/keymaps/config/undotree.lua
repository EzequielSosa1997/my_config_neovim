local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>u", group = "Undotree" },
  { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "view options" },
}, { prefix = "<leader>" })
