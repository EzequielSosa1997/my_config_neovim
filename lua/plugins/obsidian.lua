return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- Use the latest release instead of the latest commit (recommended)

    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/which-key.nvim",
    },

    opts = {
      ui = { enable = false },
      workspaces = {
        {
          name = "notes",
          path = "/home/ezequiel/.config/touch/backups/obsidian/notes", -- Path to the notes directory
        },
        {
          name = "activar_v2",
          path = "/home/ezequiel/.config/touch/backups/obsidian/activar_v2", -- Path to the notes directory
        },
      },

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "daily-notes" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      note_id_func = function(title)
        if not title then
          title = vim.fn.input("Nombre de la nota: ")
        end
        return title:gsub(" ", "-"):lower()
      end,
    },
  },
}
