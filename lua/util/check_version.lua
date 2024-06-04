if vim.fn.has("nvim-0.10.0") == 0 then
    -- stylua: ignore
    vim.api.nvim_echo({
        { "the configuration requires neovim version >= 0.10.0\n", "ErrorMsg" },
        { "update to a newer version of neovim\n",                 "WarningMsg", },
        { "press any key to exit...",                              "MoreMsg" },
    }, true, {})

    vim.fn.getchar()
    vim.cmd.quit()
end
