return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function line_count()
      return vim.api.nvim_buf_line_count(0)
    end

    local function datetime()
      return os.date("%H:%M %A %B %Y/%m/%d")
    end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "gruvbox_dark",
        component_separators = { left = "┃", right = "┃" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {
            "help",
            "startify",
            "dashboard",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "alpha",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
          },
        },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1200,
          tabline = 1200,
          winbar = 1200,
        },
      },
      sections = {
        lualine_a = {
          { "branch", icon = "", padding = { left = 1, right = 1 } },
        },
        lualine_b = {
          { "diff", icon = "", padding = { left = 1, right = 1 } },
          { "diagnostics", padding = { left = 1, right = 1 } },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
          { "filetype", icon_only = true, padding = { left = 1, right = 1 } },
        },
        lualine_z = {
          { "fileformat", padding = { left = 1, right = 1 } },
          { datetime, icon = "", padding = { left = 1, right = 1 } },
          { "filesize", padding = { left = 1, right = 1 } },
          { "location", padding = { left = 1, right = 1 } },
          { "progress", padding = { left = 1, right = 1 } },
          { line_count, icon = "☰", padding = { left = 1, right = 1 } },
          { "mode", padding = { left = 1, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "nvim-tree", "oil", "lazy" },
    })
  end,
}
