return {
	"jiaoshijie/undotree",
    lazy = true,
	config = true,
	keys = {
		-- { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		{
			"<leader>u",
			function()
				require("undotree").toggle()
			end,
		},
	},
}
