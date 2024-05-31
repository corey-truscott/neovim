return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            config = function()
                local ok = pcall(require("telescope").load_extension, "fzf")
                if not ok then
                    vim.api.nvim_echo({
                        { "Unable to load fzf-native\n", "ErrorMsg" },
                    }, true, {})
                end
            end,
        },
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
    keys = {
        {
            "<leader>pv",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Find files",
        },
        {
            "<leader>ps",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Live grep",
        },
        {
            "<leader>pb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Search buffers",
        },
        {
            "<leader>ph",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Search help pages",
        },
        {
            "<leader>pk",
            function()
                require("telescope.builtin").keymaps()
            end,
            desc = "Search keymaps",
        },
        {
            "<leader>pr",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Search old files",
        },
        {
            "<leader>p*",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
            end,
            desc = "Search word under cursor",
        },
        {
            "<leader>pds",
            function()
                require("telescope.builtin").lsp_document_symbols()
            end,
            desc = "Search document symbols",
        },
        { "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Search Todo comments" },
    },
}
