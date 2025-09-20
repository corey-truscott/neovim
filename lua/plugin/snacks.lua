return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        words = { enabled = true },

        image = { enabled = false },

        notifier = {
            timeout = 3000,
            width = { min = 40, max = 0.4 },
            height = { min = 1, max = 0.6 },
            margin = { top = 0, right = 1, bottom = 0 },
            padding = true,
            sort = { "level", "added" },
            level = vim.log.levels.TRACE,
            icons = {
                error = " ",
                warn = " ",
                info = " ",
                debug = " ",
                trace = " ",
            },
            keep = function(notif)
                return vim.fn.getcmdpos() > 0
            end,
            ---@type snacks.notifier.style
            style = "compact",
            top_down = true,    -- place notifications from top to bottom
            date_format = "%R", -- time format for notifications
            -- format for footer when more lines are available
            -- `%d` is replaced with the number of lines.
            -- only works for styles with a border
            ---@type string|boolean
            more_format = " ↓ %d lines ",
            refresh = 50, -- refresh at most every 50ms
        },
    },
    keys = {
        -- stylua: ignore start
        { "<leader>CS", function() Snacks.picker.colorschemes() end,   desc = "Colorschemes" },
        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        -- stylua: ignore end
    },
}

-- keys = {
--   -- Top Pickers & Explorer
--   { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
--   { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
--   { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
--   { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
--   { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
--   { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
--   -- find
--   { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
--   { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
--   { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
--   { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
--   { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
--   { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
--   -- git
--   { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
--   { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
--   { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
--   { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
--   { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
--   { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
--   { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
--   -- Grep
--   { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
--   { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
--   { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
--   { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
--   -- search
--   { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
--   { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
--   { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
--   { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
--   { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
--   { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
--   { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
--   { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
--   { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
--   { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
--   { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
--   { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
--   { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
--   { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
--   { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
--   { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
--   { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
--   { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
--   { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
--   { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
--   -- LSP
--   { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
--   { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
--   { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
--   { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
--   { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
--   { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
--   { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
--   -- Other
--   { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
--   { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
--   { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
--   { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
--   { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
--   { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
--   { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
--   { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
--   { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
--   { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
--   { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
--   { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
--   { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
--   { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
--   {
--     "<leader>N",
--     desc = "Neovim News",
--     function()
--       Snacks.win({
--         file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
--         width = 0.6,
--         height = 0.6,
--         wo = {
--           spell = false,
--           wrap = false,
--           signcolumn = "yes",
--           statuscolumn = " ",
--           conceallevel = 3,
--         },
--       }
