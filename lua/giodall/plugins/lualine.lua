return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "dracula-nvim",
			},
			tabline = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
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
	end,
}
