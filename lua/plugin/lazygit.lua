return {
	"kdheepak/lazygit.nvim",
	cmd = "LazyGit",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
    keys = {
        {
            "<leader>gg",
            "<cmd>LazyGit<cr>",
            desc = "Lazy Git"
        },
    },
}
