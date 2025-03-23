local okWich, with_key = pcall(require, "which-key")

if not okWich then
  return
end

with_key.add({
  { "<leader>t", group = "Terminal" }, -- Grupo principal Terminal
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
  { "<leader>ts", "<cmd>lua _TRANSESEN_TOGGLE()<cr>", desc = "Trans ES -> EN" },
  { "<leader>te", "<cmd>lua _TRANSENES_TOGGLE()<cr>", desc = "Trans EN -> ES" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
  { "<leader>tt", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
}, { prefix = "<leader>" })
