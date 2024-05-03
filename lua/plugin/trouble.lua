return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>tt",
			function()
				require("trouble").toggle()
			end,
			desc = "Trouble",
		},
	},
}
