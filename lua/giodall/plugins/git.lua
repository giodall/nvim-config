return {

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gi", ":Git<CR>", { desc = "[I]nterface" })
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "[P]ush" })
			vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "[L]ush" })
			vim.keymap.set("n", "<leader>gr", ":Git rebase -i origin/main<CR>", { desc = "[R]ebase interactive" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})

			vim.cmd([[hi DiffText guibg=green guifg=white]])
		end,
	},
}
