-- go to lua/ensure_installed/init.lua to change what is automatically installed
local ensure = require("user.ensure_installed")

return {
    {
        "neovim/nvim-lspconfig",
        -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                lazy = true,
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
                    ensure_installed = ensure.formatters or {},
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
        keys = function()
            local keys = {}

            --- add a key mapping.
            --- @param map string: the key mapping
            --- @param command function | string: the function or command to execute
            --- @param description string: the description of the key mapping
            local add_key = function(map, command, description)
                table.insert(keys, {
                    map,
                    command,
                    desc = description .. " (LSP)", -- desc is the name required by lazy
                })
            end

            add_key("<leader>M", vim.cmd.Mason, "Mason")

            add_key("]d", function()
                vim.diagnostic.jump({count=1, float=true})
            end, "Next diagnostic")

            add_key("[d", function()
                vim.diagnostic.jump({count=-1, float=true})
            end, "Previous diagnostic")

            add_key("gd", function()
                vim.lsp.buf.definition()
            end, "Goto Definition")

            add_key("gr", function()
                vim.lsp.buf.references()
            end, "Goto References")

            add_key("gI", function()
                vim.lsp.buf.implementation()
            end, "Goto Implementation")

            add_key("<leader>D", function()
                vim.lsp.buf.type_definition()
            end, "Type Definition")

            add_key("<leader>gds", function()
                vim.lsp.buf.document_symbol()
            end, "Document Symbols")

            add_key("<leader>rn", function()
                vim.lsp.buf.rename()
            end, "Rename")

            add_key("<leader>ca", function()
                vim.lsp.buf.code_action()
            end, "Code Action")

            add_key("K", function()
                vim.lsp.buf.hover()
            end, "Hover Documentation")

            add_key("<leader>h", function()
                vim.lsp.buf.signature_help()
            end, "Signature help")

            add_key("gD", function()
                vim.lsp.buf.declaration()
            end, "Goto Declaration") -- WARN: this is different to goto definition, this is goto declaration

            add_key("<leader>f", function()
                vim.lsp.buf.format()
            end, "Format")

            add_key("<leader>ih", function()
                ---@diagnostic disable-next-line: missing-parameter
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "Inlay Hints")

            add_key("<leader>cl", function()
                vim.lsp.codelens.run()
            end, "Codelens")

            return keys
        end,

        config = function()
            local diagnostics_icons = {
                Error = "󰅚 ",
                Warn = "󰀪 ",
                Hint = "󰌶 ",
                Info = " ",
            }

            local signs = { text = {}, texthl = {}, numhl = {} }
            for type, icon in pairs(diagnostics_icons) do
                local hl = "DiagnosticSign" .. type
                local severity = vim.diagnostic.severity[string.upper(type)]
                signs.text[severity] = icon
                signs.texthl[severity] = hl
                signs.numhl[severity] = hl
            end

            vim.diagnostic.config({
                signs = signs,
            })

            vim.api.nvim_create_autocmd({ "LspAttach" }, {
                callback = function()
                    vim.lsp.inlay_hint.enable(true)
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend(
                "force",
                capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            require("mason").setup()

            local ensure_installed = vim.tbl_keys(ensure.server or {})
            vim.list_extend(ensure_installed, {})
            require("mason-tool-installer").setup({
                ensure_installed = ensure_installed,
            })

            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        local server = ensure.server[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend(
                            "force",
                            {},
                            capabilities,
                            server.capabilities or {}
                        )
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}
