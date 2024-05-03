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
			desc = "DESCRIPTION",
		},
		{
			"<leader>pv",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "DESCRIPTION",
		},
		{
			"<leader>ps",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "DESCRIPTION",
		},
		{
			"<leader>pb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "DESCRIPTION",
		},
		{
			"<leader>ph",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "DESCRIPTION",
		},
		{
			"<leader>pk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "DESCRIPTION",
		},
		{
			"<leader>pr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "DESCRIPTION",
		},
		{ "<leader>pt", "<cmd>TodoTelescope<cr>", desc = "Search Todo comments" },
	},
}
