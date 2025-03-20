return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local _ok, telescope = pcall(require, "telescope")
    if not _ok then
      return
    end

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--no-ignore",
          "--smart-case",
          "--hidden", -- Permite archivos ocultos
        },
        file_ignore_patterns = {
          ".git/",
          ".settings/",
          ".metadata/",
          "target/",
          "node_modules/",
          ".class/",
          ".sst",
          ".next",
          -- Eliminamos ".env" para que los detecte
        },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
          },
        },
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.95, -- Aumenta el ancho
          height = 0.95, -- Aumenta la altura
          preview_width = 0.6, -- Mayor espacio para la vista previa
        },
        path_display = { "truncate" }, -- Mantiene el path más limpio
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      },
    })
  end,
}
