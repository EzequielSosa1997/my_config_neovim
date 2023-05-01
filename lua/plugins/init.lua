local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	--PACKER
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	--NVIM-WEB-DEVICONS
	use("nvim-tree/nvim-web-devicons")

	--NEO-TREE
	--
	--DEPENDECIES---------------------
	use({ "MunifTanjim/nui.nvim" })
	-----------------------------------
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		config = require("plugins.config.neotree"),
	})

	--BUFFER
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = require("plugins.config.bufferline"),
	})
	--LUALINE
	use({
		"nvim-lualine/lualine.nvim",
		config = require("plugins.config.lualine"),
	})

	--TELESCOPE----------------------------------------
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		config = require("plugins.config.telescope"),
	})

	---------------------------------------------------
	--THEME
	use({
		"folke/tokyonight.nvim",
	})

	use({
		"navarasu/onedark.nvim",
		config = require("plugins.config.theme"),
	})

	use({
		"projekt0n/github-nvim-theme",
		tag = "v0.0.7",
	})

	use({ "Mofiqul/vscode.nvim" })

	use({ "rebelot/kanagawa.nvim" })

	--TOGGLETERM
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = require("plugins.config.toggleterm"),
	})

	--LSP-MASON-NULL---------------------------------
	--
	use("neovim/nvim-lspconfig")

	use({
		"williamboman/mason.nvim",
		config = require("plugins.lsp.mason"),
	})

	use({ "williamboman/mason-lspconfig.nvim" })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = require("plugins.lsp.null"),
	})

	--JAVA---------JTDLS-----------------------------------------

	use({
		"ray-x/lsp_signature.nvim",
	})

	use({
		"mfussenegger/nvim-jdtls",
		config = require("plugins.jdtls"),
	})

	--TEST-BREAKPOINT--------------------------------------------

	use({
		"mfussenegger/nvim-dap",
	})

	--TREESSITTER-----------------------------------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = require("plugins.config.treesitter"),
	})
	--TREESSITTER-CONTEXT
	use({ "nvim-treesitter/nvim-treesitter-context", config = require("plugins.config.treesitter.context") })

	--BRACKETS PARENTHESIS KEY
	use({ "mrjones2014/nvim-ts-rainbow" })

	-------------------------------------------------------------------

	use({
		"hrsh7th/nvim-cmp",
		config = require("plugins.lsp.cmp"), -- Autocompletion plugins
	})

	use({ "L3MON4D3/LuaSnip" })

	use({ "hrsh7th/cmp-nvim-lsp" }) -- Autocompletion with LSPs

	use({ "hrsh7th/cmp-buffer" })

	use({ "hrsh7th/cmp-path" })

	use({ "hrsh7th/cmp-cmdline" })

	--For vsnip users.

	use({ "hrsh7th/cmp-vsnip" })

	use({ "hrsh7th/vim-vsnip" })

	--For luasnip users.
	use({ "saadparwaiz1/cmp_luasnip" })

	--For ultisnips users.
	use({ "SirVer/ultisnips" })

	use({ "quangnguyen30192/cmp-nvim-ultisnips" })

	--For snippy users.
	use({ "dcampos/nvim-snippy" })

	use({ "dcampos/cmp-snippy" })

	use({ "honza/vim-snippets" })

	use({ "hrsh7th/cmp-calc" })

	use({ "f3fora/cmp-spell" })

	use({ "tamago324/cmp-zsh" })

	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

	--COMMENT
	--
	use({
		"numToStr/Comment.nvim",
		config = require("plugins.config.comment"),
	})

	--GIT--------------------------------------------------------
	--GITGUTTER
	use({ "airblade/vim-gitgutter", config = require("plugins.config.gitgutter") })

	--FUGITIVE
	use({ "tpope/vim-fugitive" })
	-------------------------------------------------------------

	--CLOSE_BUFFER
	--
	use({ "ojroques/nvim-bufdel" })

	--DELIMITE [] {}
	--
	use({ "Raimondi/delimitMate" })

	--TEST
	--
	use({
		"michaelb/sniprun",
		run = "bash install.sh",
	})

	-- use({
	-- 	"Pocco81/auto-save.nvim",
	-- 	config = require("plugins.config.autosave"),
	-- })

	--REST-SERVER
	--
	use({
		"rest-nvim/rest.nvim",
		config = require("plugins.config.rest-server"),
	})

	--MULT-CURSOR
	--
	use({ "mg979/vim-visual-multi", branch = "master" })

	--KEYMAP
	--
	use({ "folke/which-key.nvim", config = require("plugins.config.which_key") })

	--UNDOTREE
	--
	use({ "mbbill/undotree" })

	--SURROUND
	--
	use({ "tpope/vim-surround" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
