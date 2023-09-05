require("mason").setup()
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = {
		--lua
		"stylua",
		"lua-language-server",
		--rust
		"codelldb",
		"rust-analyzer",
		--python
		-- "mypy",
		"debugpy",
		"ruff-lsp",
		"pyright",
		"black",
		--frontend
		"svelte-language-server",
		"typescript-language-server",
		"tailwindcss-language-server",
		"eslint-lsp",
		"prettierd",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspsaga").setup({
	code_action_icon = "💡",
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = " ",
		show_file = true,
		file_formatter = "",
	},
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

--frontend
require("lspconfig").svelte.setup({
	capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
})

require("lspconfig").tailwindcss.setup({
	capabilities = capabilities,
})
require("lspconfig").eslint.setup({
	capabilities = capabilities,
})

--python
require("lspconfig").pyright.setup({
	capabilities = capabilities,
})
require("lspconfig").ruff_lsp.setup({
	capabilities = capabilities,
})

-- this is for diagnostics signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
