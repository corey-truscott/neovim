vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",

    {
        src = "https://github.com/Saghen/blink.cmp",
        version = vim.version.range("1.x"),
    },
})

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if
            ev.data.spec.name == "LuaSnip"
            and (ev.data.kind == "install" or ev.data.kind == "update")
        then
            -- install jsregexp (optional but recommended)
            vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path })
        end
    end,
})

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
    keymap = {
        preset = "default",
        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = {
        nerd_font_variant = "mono",
    },

    completion = {
        -- default bind to show docs is <C-Space>
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        menu = {
            draw = {
                -- nvim-highlight-colors integration
                components = {
                    -- customize the drawing of kind icons
                    kind_icon = {
                        text = function(ctx)
                            -- default kind icon
                            local icon = ctx.kind_icon
                            -- if LSP source, check for color derived from documentation
                            if ctx.item.source_name == "LSP" then
                                local color_item =
                                    require("nvim-highlight-colors").format(
                                        ctx.item.documentation,
                                        { kind = ctx.kind }
                                    )
                                if color_item and color_item.abbr ~= "" then
                                    icon = color_item.abbr
                                end
                            end
                            return icon .. ctx.icon_gap
                        end,
                        highlight = function(ctx)
                            -- default highlight group
                            local highlight = "BlinkCmpKind" .. ctx.kind
                            -- if LSP source, check for color derived from documentation
                            if ctx.item.source_name == "LSP" then
                                local color_item =
                                    require("nvim-highlight-colors").format(
                                        ctx.item.documentation,
                                        { kind = ctx.kind }
                                    )
                                if color_item and color_item.abbr_hl_group then
                                    highlight = color_item.abbr_hl_group
                                end
                            end
                            return highlight
                        end,
                    },
                },
            },
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
})
