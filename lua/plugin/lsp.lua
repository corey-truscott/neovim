return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- lsp
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "clangd",
                    "gopls",

                    -- formatter
                    -- "stylua",
                    -- "black",
                    -- "isort",
                    -- "gofumpt",
                    -- "golines",
                    -- "gci",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.marksman.setup({ capabilities = capabilities })
        end,
    },
}
