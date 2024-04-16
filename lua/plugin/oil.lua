return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
			"size",
			-- "permissions",
			-- "mtime",
		},
		cleanup_delay_ms = 10000,

		keymaps_help = {
			border = "rounded",
		},
		view_options = {
			show_hidden = true,
			natural_order = true,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
		-- Configuration for the floating window in oil.open_float
		float = {
			-- Padding around the floating window
			padding = 10,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
		preview = {
			-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_width and max_width can be a single value or a list of mixed integer/float types.
			-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
			max_width = 0.9,
			-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
			min_width = { 40, 0.4 },
			-- optionally define an integer/float for the exact width of the preview window
			width = nil,
			-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_height and max_height can be a single value or a list of mixed integer/float types.
			-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
			max_height = 0.9,
			-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
			min_height = { 5, 0.1 },
			-- optionally define an integer/float for the exact height of the preview window
			height = nil,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- Whether the preview window is automatically updated when the cursor is moved
			update_on_cursor_moved = true,
		},
		-- Configuration for the floating progress window
		progress = {
			max_width = 0.9,
			min_width = { 40, 0.4 },
			width = nil,
			max_height = { 10, 0.9 },
			min_height = { 5, 0.1 },
			height = nil,
			border = "rounded",
			minimized_border = "none",
			win_options = {
				winblend = 0,
			},
		},
		-- Configuration for the floating SSH window
		ssh = {
			border = "rounded",
		},
	},
	config = function()
        require("oil").setup({})

		local oil = require("oil")
		vim.keymap.set("n", "<leader>o", oil.open_float, { desc = "Oil" })
	end,
}
