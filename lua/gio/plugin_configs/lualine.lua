require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "dracula-nvim",
	},
	sections = {
		lualine_a = {
			{
				"buffers",
			},
		},
		lualine_c = {
			{
				"filename",
				symbols = {
					modified = "●",
				},
			},
		},
	},
})
