return {
	"jiaoshijie/undotree",
	lazy = true,
	config = true,
	keys = {
		{
			"<leader>u",
			function()
				require("undotree").toggle()
			end,
			desc = "Undotree",
		},
	},
}
