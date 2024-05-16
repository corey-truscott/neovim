return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	opts = {},
	keys = {

		{
			"<leader>gp",
			function()
				-- vim.cmd[[Gitsigns preview_hunk]]
				require("gitsigns").setup()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview hunk",
		},
		{
			"<leader>gj",
			function()
				-- vim.cmd[[Gitsigns next_hunk]]
				require("gitsigns").next_hunk()
			end,
			desc = "Next hunk",
		},
		{
			"<leader>gk",
			function()
				-- vim.cmd[[Gitsigns prev_hunk]]
				require("gitsigns").prev_hunk()
			end,
			desc = "Previous hunk",
		},
		{
			"<leader>gb",
			function()
				-- vim.cmd[[Gitsigns toggle_current_line_blame]]
				require("gitsigns").toggle_current_line_blame()
			end,
			desc = "Toggle Blame",
		},
	},
}
