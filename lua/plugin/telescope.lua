return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
    opts = {},
    -- TODO: add keybinding for live grep across project, maybe a bind like p*
    -- TODO: add descriptions
	keys = {
		{
			"<leader>p*",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "WIP",
		},
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
            function ()
                require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
            end,
            desc = "Search word under cursor"
        },
		{ "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Search Todo comments" },
	},
}
