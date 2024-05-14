return {
	{
		"nat-418/boole.nvim",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
			-- User defined loops
			additions = {
				-- { "Foo", "Bar" },
				-- { "tic", "tac", "toe" },
			},
			allow_caps_additions = {
				-- { "enable", "disable" },
				-- enable → disable
				-- Enable → Disable
				-- ENABLE → DISABLE
			},
		},
	},
	{
		"tpope/vim-speeddating",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
}
