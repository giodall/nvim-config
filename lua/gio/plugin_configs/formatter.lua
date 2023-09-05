local M = {
	filetype = {
		--lua
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		--python
		python = {
			require("formatter.filetypes.python").black,
		},
		--frontend
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		svelte = {
			require("formatter.filetypes.typescript").prettierd,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = "FormatWriteLock",
})

return M
