local esc = require("smart-term-esc")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

esc.setup({
	key = "<Esc>",
	except = { "nvim", "fzf" },
})
