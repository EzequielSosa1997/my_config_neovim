return {
  "kelly-lin/ranger.nvim",
  config = function()
    local ranger_nvim = require("ranger-nvim")
    ranger_nvim.setup({
      enable_cmds = false,
      replace_netrw = false,
      keybinds = {
        ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
        ["oh"] = ranger_nvim.OPEN_MODE.split,
        ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
        ["or"] = ranger_nvim.OPEN_MODE.rifle,
      },
      ui = {
        height = 0.95,
        width = 1,
        x = 0.9,
        y = 1,
      },
    })
    vim.api.nvim_set_keymap("n", "<leader>y", "", {
      callback = function()
        require("ranger-nvim").open(true)
      end,
      desc = "Ranger",
    })
  end,
}
