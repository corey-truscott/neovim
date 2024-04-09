return {
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 0
            require("which-key").setup({
                presets = {
                    operators = false,
                    motions = false,
                },
            })
            local wk = require("which-key")
            local builtin = require("telescope.builtin")

            -- vim.lsp.buf.format

            wk.register({
                -- quit all
                q = { "<cmd>qa!<cr>", "quit all" },
                -- lazy
                L = { vim.cmd.Lazy, "lazy" },
                -- neotree
                e = { "<cmd>Neotree toggle<cr>", "file tree" },
                -- trouble and todo comments
                t = {
                    t = { vim.cmd.TroubleToggle, "trouble" },
                    j = { function() require("todo-comments").jump_next() end, "next todo" },
                    k = { function() require("todo-comments").jump_prev() end, "previous todo" },
                    f = { vim.cmd.TodoTelescope, "todo find" },
                },
                -- formats (requires formatter installed via :Mason)
                F = { vim.lsp.buf.format, "format" },
                -- makes current file executable
                x = { "<cmd>!chmod +x %<cr>", "make file executable" },
                -- undotree
                u = { vim.cmd.UndotreeToggle, "undotree" },
                -- telescope
                p = {
                    name = "telescope",
                    -- find files
                    f = { builtin.find_files, "find files" },
                    -- find buffers
                    b = { builtin.buffers, "find buffers" },
                    -- find old files
                    o = { builtin.oldfiles, "find old files" },
                    -- grep string search
                    s = {
                        function()
                            builtin.grep_string({ search = vim.fn.input("Grep > ") })
                        end,
                        "grep string search",
                    },
                },
                -- LSP
                l = {
                    name = "LSP",
                    h = { function() vim.lsp.buf.hover() end, "hover" },
                    s = { function() vim.lsp.buf.workspace_symbol() end, "view workspace symbol" },
                    d = { function() vim.diagnostic.open_float() end, "open diagnostic float" },
                    j = { function() vim.diagnostic.goto_next() end, "goto next diagnostic" },
                    k = { function() vim.diagnostic.goto_prev() end, "goto previous diagnostic" },
                    a = { function() vim.lsp.buf.code_action() end, "code action" },
                    f = { function() vim.lsp.buf.references() end, "references" },
                    r = { function() vim.lsp.buf.rename() end, "rename" },
                    m = { vim.cmd.Mason, "lsp installer" },
                },
                g = {
                    name = "git",
                    p = { "<cmd>Gitsigns preview_hunk<cr>", "preview hunk" },
                    j = { "<cmd>Gitsigns next_hunk<cr>", "next hunk" },
                    k = { "<cmd>Gitsigns prev_hunk<cr>", "previous hunk" },
                    b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "toggle inline blame" },
                }
            }, { prefix = "<leader>" })
        end,
    },
}
