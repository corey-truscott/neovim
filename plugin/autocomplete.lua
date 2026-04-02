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
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
})
