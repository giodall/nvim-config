return {
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme dracula")
		end,
	},
	{
        "sychen52/smart-term-esc.nvim",
        config=function()

            local esc = require("smart-term-esc")
            esc.setup({
                key = "<Esc>",
                except = { "nvim", "fzf" },
            })
        end
    },
	"tpope/vim-commentary",
}
