return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"clangd",
					"gopls",
					"marksman",
					"jsonls",
					"html",
					"ltex",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.clangd.setup({})
			lspconfig.gopls.setup({})
			lspconfig.marksman.setup({})
			lspconfig.html.setup({})
			lspconfig.bashls.setup({})
			lspconfig.ltex.setup({})
		end,
		-- config = function()
		--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
		--     local lspconfig = require("lspconfig")
		--     lspconfig.lua_ls.setup({ capabilities = capabilities })
		--     lspconfig.pyright.setup({ capabilities = capabilities })
		--     lspconfig.rust_analyzer.setup({ capabilities = capabilities })
		--     lspconfig.clangd.setup({ capabilities = capabilities })
		--     lspconfig.gopls.setup({ capabilities = capabilities })
		--     lspconfig.marksman.setup({ capabilities = capabilities })
		--     lspconfig.html.setup({ capabilities = capabilities })
		--     lspconfig.bashls.setup({ capabilities = capabilities })
		--     lspconfig.ltex.setup({ capabilities = capabilities })
		-- end,
	},
}
