return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({
			-- severity = vim.diagnostic.severity.ERROR,
		})
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").filter({ severity = vim.diagnostic.severity.WARNING })
			require("trouble").toggle()
		end, { desc = "[T]oggle menu with [W]arning" })
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end, { desc = "[T]oggle menu" })
		vim.keymap.set("n", "<leader>tn", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end, { desc = "[N]ext error" })
		vim.keymap.set("n", "<leader>tp", function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end, { desc = "[P]revious error" })
	end,
}
