return {
	"folke/trouble.nvim",
	-- config = function()
	-- 	require("trouble").setup({
	-- 		-- severity = vim.diagnostic.severity.ERROR,
	-- 	})
	-- 	vim.keymap.set(
	-- 		"n",
	-- 		"<leader>tw",
	-- 		"<cmd>Trouble diagnostics toggle filter.severity=WARNING<cr>",
	-- 		{ desc = "[T]oggle menu with [W]arning" }
	-- 	)
	-- 	vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "[T]oggle menu" })
	-- end,
	opts = { -- for default options, refer to the configuration section for custom setup.
		modes = {
			no_hints = {
				mode = "diagnostics",
				filter = {
					["not"] = { severity = vim.diagnostic.severity.HINT },
				},
			},
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[T]oggle [T]rouble",
		},
		{
			"<leader>te",
			"<cmd>Trouble no_hints toggle<cr>",
			desc = "[T]rouble menu with [E]rror filter",
		},
		{
			"<leader>tT",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[T]oggle [T]rouble for current buffer",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "[T]rouble [S]ymbols",
		},
		{
			"<leader>tl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "[T]rouble [L]SP Definitions / references / ...",
		},
		{
			"<leader>tL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "[T]rouble Location [L]ist",
		},
		{
			"<leader>tQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "[T]rouble [Q]uickfix List",
		},
	},
}
