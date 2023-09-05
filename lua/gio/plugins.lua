local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
	},
	{
		"NvChad/nvim-colorizer.lua",
		lazy = false,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"mbbill/undotree",
	"sychen52/smart-term-esc.nvim",
	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	"nvimdev/lspsaga.nvim",
	{
		"mhartington/formatter.nvim",
		event = "VeryLazy",
		opts = function()
			return require("gio.plugin_configs.formatter")
		end,
	},
	-- rust
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
	},
	{
		"rust-lang/rust.vim",
		ft = { "rust" },
	},
	--python
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("dap-python").test_runner = "pytest"
		end,
	},
	--debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-commentary",
	"vim-test/vim-test",
}

local opts = {}

require("lazy").setup(plugins, opts)
