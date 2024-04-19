-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Buffer
vim.keymap.set("n", "<leader><Left>", ":bprevious<CR>", { desc = "Move focus to the left buffer" })
vim.keymap.set("n", "<leader><Right>", ":bnext<CR>", { desc = "Move focus to the right buffer" })

local function deleteBuffer()
	local cmd = "bdelete"
	-- local cmd = "b#<bar>bd#<CR>"

	local buf = vim.api.nvim_command_output("ls %")
	if string.find(buf, "R") then
		-- cmd = "b#<bar>bd!#<CR>"
		cmd = "bdelete!"
	end

	if math.floor(#vim.api.nvim_command_output("ls") / 46) > 1 then
		vim.cmd("b#")
		cmd = string.format("%s#", cmd)
	end
	vim.cmd(cmd)
end
vim.keymap.set("n", "<leader><Down>", deleteBuffer, { desc = "Delete buffer" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[V]iew tree" })

-- copy to clipboard with ctrl c
vim.keymap.set("v", "<C-c>", '"*y')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
