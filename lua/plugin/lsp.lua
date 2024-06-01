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
        keys = function()
            local keys = {}

            --- add a key mapping.
            --- @param map string: the key mapping
            --- @param command function | string: the function or command to execute
            --- @param description string: the description of the key mapping
            local addKey = function(map, command, description)
                table.insert(keys, {
                    map,
                    command,
                    desc = "LSP: " .. description, -- desc is the name required by lazy
                })
            end

            addKey("<leader>M", vim.cmd.Mason, "Mason")

            addKey("]d", function()
                vim.diagnostic.goto_next()
            end, "Next diagnostic")

            addKey("[d", function()
                vim.diagnostic.goto_prev()
            end, "Previous diagnostic")

            addKey("gd", function()
                vim.lsp.buf.definition()
            end, "Goto Definition")

            addKey("gr", function()
                vim.lsp.buf.references()
            end, "Goto References")

            addKey("gI", function()
                vim.lsp.buf.implementation()
            end, "Goto Implementation")

            addKey("<leader>D", function()
                vim.lsp.buf.type_definition()
            end, "Type Definition")

            addKey("<leader>ds", function()
                vim.lsp.buf.document_symbol()
            end, "Document Symbols")

            addKey("<leader>rn", function()
                vim.lsp.buf.rename()
            end, "Rename")

            addKey("<leader>ca", function()
                vim.lsp.buf.code_action()
            end, "Code Action")

            addKey("K", function()
                vim.lsp.buf.hover()
            end, "Hover Documentation")

            addKey("<leader>h", function()
                vim.lsp.buf.signature_help()
            end, "Signature help")

            addKey("gD", function()
                vim.lsp.buf.declaration()
            end, "Goto Declaration") -- WARN: this is different to goto definition, this is goto declaration

            addKey("<leader>f", function()
                vim.lsp.buf.format()
            end, "Format")

            addKey("<leader>ih", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, "Inlay Hints")

            addKey("<leader>cl", function()
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

    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
}
