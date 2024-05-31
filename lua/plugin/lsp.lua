--
-- if you want to ensure lsp servers or formatters are installed, you can
-- list them here. Just follow how they are formatted.
--
-- otherwise, use :Mason or :MasonInstall to install them, but they wont
-- carry over if you copy your configuration to another computer.
--

local servers = {
    -- clangd = {},
    -- gopls = {},
    -- html = {},
    -- jsonls = {},
    -- marksman = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- lua_ls = {},
}

local formatters = {
    -- "stylua",
    -- "black",
    -- "cbfmt",
    -- "gofumpt",
    -- "golines",
    -- "isort",
    -- "mdformat",
    -- "shfmt",
}

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                lazy = true,
            },

            {
                "folke/neodev.nvim",
                opts = {},
            },

            {
                "j-hui/fidget.nvim",
                opts = {},
            },

            {
                "jay-babu/mason-null-ls.nvim",
                event = { "BufReadPost", "BufWritePost", "BufNewFile" },
                opts = {
                    automatic_installation = false,
                    handlers = {},
                },
            },

            {
                "nvimtools/none-ls.nvim",
                event = { "BufReadPost", "BufWritePost", "BufNewFile" },

                opts = {
                    sources = {},
                },
            },
        },
        keys = {
            {
                "<leader>M",
                vim.cmd.Mason,
                desc = "LSP: Mason",
            },

            {
                "]d",
                function()
                    vim.diagnostic.goto_next()
                end,
                desc = "LSP: Next diagnostic",
            },

            {
                "[d",
                function()
                    vim.diagnostic.goto_prev()
                end,
                desc = "LSP: Previous diagnostic",
            },

            {
                "gd",
                function()
                    vim.lsp.buf.definition()
                end,
                desc = "LSP: Goto Definition",
            },

            {
                "gr",
                function()
                    vim.lsp.buf.references()
                end,
                desc = "LSP: Goto References",
            },

            {
                "gI",
                function()
                    vim.lsp.buf.implementation()
                end,
                desc = "LSP: Goto Implementation",
            },

            {
                "<leader>D",
                function()
                    vim.lsp.buf.lsp_type_definition()
                end,
                desc = "LSP: Type Definition",
            },

            {
                "<leader>ds",
                function()
                    vim.lsp.buf.document_symbol()
                end,
                desc = "LSP: Document Symbols",
            },

            {
                "<leader>rn",
                function()
                    vim.lsp.buf.rename()
                end,
                desc = "LSP: Rename",
            },

            {
                "<leader>ca",
                function()
                    vim.lsp.buf.code_action()
                end,
                desc = "LSP: Code Action",
            },

            {
                "K",
                function()
                    vim.lsp.buf.hover()
                end,
                desc = "LSP: Hover Documentation",
            },

            {
                "<leader>h",
                function()
                    vim.lsp.buf.signature_help()
                end,
                desc = "LSP: Signature help",
            },

            {
                "gD",
                function()
                    vim.lsp.buf.declaration()
                end,
                desc = "LSP: Goto Declaration", -- WARN: this is different to goto definition, this is goto declaration
            },

            {
                "<leader>f",
                function()
                    vim.lsp.buf.format()
                end,
                desc = "LSP: Format",
            },

            {
                "<leader>ih",
                function()
                    ---@diagnostic disable-next-line: missing-parameter
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end,
                desc = "LSP: Inlay Hints",
            },

            {
                "<leader>cl",
                function()
                    ---@diagnostic disable-next-line: missing-parameter
                    vim.lsp.codelens.run()
                end,
                desc = "LSP: Codelens",
            },
        },

        config = function()
            local diagnostics_icons = {
                Error = "󰅚 ",
                Warn = "󰀪 ",
                Hint = "󰌶 ",
                Info = " ",
            }

            for type, icon in pairs(diagnostics_icons) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            vim.api.nvim_create_autocmd({ "LspAttach" }, {
                callback = function()
                    vim.lsp.inlay_hint.enable(true)
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

            require("mason").setup()
            if next(servers) ~= nil then
                local ensure_installed = vim.tbl_keys(servers or {})
                vim.list_extend(ensure_installed, formatters or {})
                require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
            end

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
