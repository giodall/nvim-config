
return {
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", function()
				vim.cmd.UndotreeToggle()
				vim.cmd.UndotreeFocus()
			end)

			vim.opt.swapfile = false
			vim.opt.backup = false
			vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
			vim.opt.undofile = true
		end,
	}
