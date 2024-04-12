return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,

				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- go
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,

				-- markdown
				null_ls.builtins.formatting.cbfmt,
				null_ls.builtins.formatting.mdformat,

				-- html, json, js, etc
				null_ls.builtins.formatting.prettier,
			},
		})

		mason_null_ls.setup({
			ensure_installed = {
				"black",
				"cbfmt",
				"gci",
				"gofumpt",
				"golines",
				"isort",
				"mdformat",
				"stylua",
				"prettier",
			},
		})
	end,
}
