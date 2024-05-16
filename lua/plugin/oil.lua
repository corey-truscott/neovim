return {
	"stevearc/oil.nvim",
	lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>o",
			function()
				require("oil").open_float()
			end,
			desc = "Oil",
		},
	},
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
		},

		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
	},
}
