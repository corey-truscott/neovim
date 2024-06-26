--
-- if you want to ensure lsp servers, formatters, debuggers or treesitter syntaxes are installed,
-- you can list them here. just follow how they are formatted.
--
-- otherwise, use :Mason or :MasonInstall to install them, but they wont
-- carry over if you copy your configuration to another computer.
--

local ensure_installed = {
    debugger = {
        -- "python",
        -- "delve",
        -- "elixir",
    },

    server = {
        -- clangd = {},
        -- gopls = {},
        -- html = {},
        -- jsonls = {},
        -- marksman = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- lua_ls = {},
        -- aiken = {},
    },

    formatters = {
        -- "stylua",
        -- "black",
        -- "ruff",
        -- "cbfmt",
        -- "gofumpt",
        -- "golines",
        -- "isort",
        -- "shfmt",
        -- "mdformat",
    },

    -- these automatically install when you open the specified file type,
    -- but maybe you want them to automatically install either way
    syntax = {
        "comment",         -- always keep this one
        "markdown_inline", -- this doesnt automatically install with markdown, so its nice to have

        -- "lua",
        -- "c",
        -- "go",
        -- "rust",
        -- "markdown",
        -- "python",
        -- "javascript",
        -- "zig",
        -- "yaml",
        -- "json",
        -- "csharp",
    },
}

return ensure_installed
