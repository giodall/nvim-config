vim.cmd([[
  let test#strategy = "neovim"
]])

function TESTNEAREST()
	if vim.bo.filetype == "python" then
		require("dap-python").test_method()
	else
		vim.cmd("TestNearest")
	end
end

vim.keymap.set("n", "<leader>t", "<cmd>lua TESTNEAREST()<CR>")
vim.keymap.set("n", "<leader>T", ":TestFile<CR>")
