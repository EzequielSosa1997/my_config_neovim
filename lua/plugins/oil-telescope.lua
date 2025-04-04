return {
  "albenisolmos/telescope-oil.nvim",
  config = function()
    local settings = require("telescope-oil.settings")
    settings.set({ hidden = true })
    settings.set({ no_ignore = false })
    settings.set({ show_preview = true })
    require("telescope").load_extension("oil")
  end,
}
