local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print('Installing packer close and reopen Neovim...')
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)

  --PACKER
  use 'wbthomason/packer.nvim' 
  use 'nvim-lua/popup.nvim' 
  use 'nvim-lua/plenary.nvim' 

  --NEO-TREE
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', 
      'MunifTanjim/nui.nvim'
    },
    config = require 'plugins.config.neotree'
  }

  --BUFFER
  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = require 'plugins.config.bufferline'
  }
  --LUALINE
  use {
    'nvim-lualine/lualine.nvim',
    config = require 'plugins.config.lualine'
  }

  --TELESCOPE
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
  }
  --THEME
  use {
    'folke/tokyonight.nvim',
    config = require 'plugins.config.theme'
  }
  
  --TOGGLETERM
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = require 'plugins.config.toggleterm' 
  }

  --LSP-MASON-NULL---------------------------------
  --    
  use 'neovim/nvim-lspconfig'
	use	{
    'williamboman/mason.nvim',
    config = require 'plugins.lsp.mason'
  }
	use	'williamboman/mason-lspconfig.nvim'
	use {
    'jose-elias-alvarez/null-ls.nvim',
    config = require 'plugins.lsp.null'
  }-- Null ls is used for code formatting and pylint analysis
  use {
    'hrsh7th/nvim-cmp',
    config = require 'plugins.lsp.cmp'  -- Autocompletion plugins
  }
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp' -- Autocompletion with LSPs
  --
  --
  --
  --
  --
  --
  --
  --
  ------------------------------------------------

  
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)