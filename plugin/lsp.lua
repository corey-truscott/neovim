vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/mason-org/mason.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end,
})

vim.keymap.set("n", "<leader>ih", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Inlay Hints" })
