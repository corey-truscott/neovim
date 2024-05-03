return {
	"folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>tn",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"<leader>tp",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
		{
			"<leader>tn",
			function()
				require("todo-comments").quic()
			end,
			-- TODO: test
			desc = "Next todo comment",
		},
		{ "<leader>tt", "<cmd>TodoTrouble<cr>", desc = "Todo Comments" },
	},
}
