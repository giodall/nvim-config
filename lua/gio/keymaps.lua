local esc = require("smart-term-esc")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

esc.setup({
	key = "<Esc>",
	except = { "nvim", "fzf" },
})

-- Buffer
vim.keymap.set("n", "<leader><Left>", function()
	print("Left")
end)
vim.keymap.set("n", "<leader><Right>", function()
	print("Right")
end)
vim.keymap.set("n", "<leader><Up>", function()
	print("Up")
end)
vim.keymap.set("n", "<leader><Down>", function()
	print("Down")
end)
vim.keymap.set("n", "<leader><Left>", ":bprevious<CR>")
vim.keymap.set("n", "<leader><Right>", ":bnext<CR>")
vim.keymap.set("n", "<leader><Down>", ":bdelete<CR>")
