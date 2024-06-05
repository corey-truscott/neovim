--
-- if you want to ensure lsp servers, formatters or debuggers are installed,
-- you can list them here. just follow how they are formatted.
--
-- otherwise, use :Mason or :MasonInstall to install them, but they wont
-- carry over if you copy your configuration to another computer.
--

local ensure_installed = {}

ensure_installed.debugger = {
    -- "python",
    -- "delve",
    -- "elixir",
}

ensure_installed.server = {
    -- clangd = {},
    -- gopls = {},
    -- html = {},
    -- jsonls = {},
    -- marksman = {},
    -- pyright = {},
    -- rust_analyzer = {},
    -- lua_ls = {},
    -- aiken = {},
}

ensure_installed.formatters = {
    -- "stylua",
    -- "black",
    -- "ruff",
    -- "cbfmt",
    -- "gofumpt",
    -- "golines",
    -- "isort",
    -- "shfmt",
    -- "mdformat",
}

return ensure_installed
