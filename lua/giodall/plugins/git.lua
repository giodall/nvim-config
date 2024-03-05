return {

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gi", ":Git<CR>", { desc = "[I]nterface" })
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "[P]ush" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.cmd([[hi DiffText guibg=green guifg=white]])
		end,
	},
}
