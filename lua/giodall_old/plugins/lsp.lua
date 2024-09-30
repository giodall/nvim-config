return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },
        config = function()
            require("fidget").setup({})
            require("mason").setup()
            local lspconfig = require('lspconfig')
            local cmp = require 'cmp'
            local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities())
            require("mason-lspconfig").setup({
                ensure_installed = {
                    --lua
                    -- "stylua", -- lspconfig name
                    "lua_ls",
                    --rust
                    -- "codelldb",
                    -- "rust-analyzer",
                    --python
                    -- "mypy",
                    -- "debugpy",
                    "ruff_lsp",
                    "pyright",
                    -- "black",
                    --frontend
                    "svelte",
                    "tsserver",
                    "tailwindcss",
                    "eslint",
                    -- "prettierd", -- error lspconfig name...
                    -- "js-debug-adapter",
                },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({ capabilities = capabilities })
                    end,
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            },
                            capabilities = capabilities
                        }
                    end,
                }
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<cr>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    -- ['<C-Space>'] = cmp.mapping.complete(),
                    -- ['<C-e>'] = cmp.mapping.abort(),
                    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })
            vim.diagnostic.config({
                update_in_insert = true
            })
        end
    }
}
