return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = false,
      },
      constrain_cursor = "editable",
      watch_for_changes = false,
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["q"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
        ["I"] = {
          callback = function()
            local oil = require("oil")
            local entry = oil.get_cursor_entry()
            local dir = oil.get_current_dir()

            if entry and entry.type == "file" and dir then
              local full_path = dir .. "/" .. entry.name
              local width = math.floor(vim.o.columns * 1)
              local height = math.floor(vim.o.lines * 1)
              local row = math.floor((vim.o.lines - height) / 2)
              local col = math.floor((vim.o.columns - width) / 2)
              local buf = vim.api.nvim_create_buf(false, true)
              if not buf then
                return
              end
              local win = vim.api.nvim_open_win(buf, true, {
                relative = "editor",
                width = width,
                height = height,
                row = row,
                col = col,
                style = "minimal",
                border = "rounded",
              })
              vim.fn.termopen("bat --style=plain --paging=never --number " .. vim.fn.shellescape(full_path))
              vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>bd!<CR>", { noremap = true, silent = true })
              vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe") -- Eliminar buffer al cerrarse
            else
              print("No file selected or not a file")
            end
          end,
          desc = "Preview file using bat in floating terminal",
        },
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        case_insensitive = false,
        sort = {
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      extra_scp_args = {},
      git = {
        add = function(path)
          return false
        end,
        mv = function(src_path, dest_path)
          return false
        end,
        rm = function(path)
          return false
        end,
      },
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        get_win_title = nil,
        preview_split = "auto",
        override = function(conf)
          return conf
        end,
      },
      preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
        disable_preview = function(filename)
          return false
        end,
        win_options = {},
      },
      confirmation = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
      ssh = {
        border = "rounded",
      },
      keymaps_help = {
        border = "rounded",
      },
    })
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil" })
  end,
}
