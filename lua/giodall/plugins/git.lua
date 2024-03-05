return {

	{
		"tpope/vim-fugitive",
		--config = function() end
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.cmd([[hi DiffText guibg=green guifg=white]])
		end,
	},
}
