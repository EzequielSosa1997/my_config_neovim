return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- local ok, lualine = pcall(require, "lualine")
    -- if ok then
    --   return {}
    -- end

    -- require("lualine").setup()

    local function line_count()
      return vim.api.nvim_buf_line_count(0)
    end
    require("lualine").setup({
      options = {
        icons_enabled = true,
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
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = { { "diff", icon = "" }, "diagnostics" },
        lualine_x = {},
        lualine_y = { "filetype" },
        lualine_z = {
          "fileformat",
          { "os.date('%H:%M %A %B %Y/%m/%d')" },
          { "filesize" },
          "location",
          "progress",
          { line_count, icon = "﬘" },
          "mode",
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
      extensions = { "nvim-tree" },
    })
  end,
}
