local servers = {
	clangd = {},
	gopls = {},
	html = {},
	jsonls = {},
	marksman = {},
	pyright = {},
	rust_analyzer = {},
	lua_ls = {},
}

local formatters = {
	"stylua",
	"black",
	"cbfmt",
	"gofumpt",
	"golines",
	"isort",
	"mdformat",
	"shfmt",
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"j-hui/fidget.nvim",
                opts = {},
			},
			{
				"folke/neodev.nvim",
				opts = {},
			},
		},

		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					-- helper function for mapping keybinds
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", function()
						vim.lsp.buf.definition()
					end, "Goto Definition")

					map("gr", function()
						vim.lsp.buf.references()
					end, "Goto References")

					map("gI", function()
						vim.lsp.buf.implementation()
					end, "Goto Implementation")
					map("<leader>D", function()
						vim.lsp.buf.lsp_type_definition()
					end, "Type Definition")

					map("<leader>ds", function()
						vim.lsp.buf.document_symbol()
					end, "Document Symbols")

					map("<leader>rn", function()
						vim.lsp.buf.rename()
					end, "Rename")

					map("<leader>ca", function()
						vim.lsp.buf.code_action()
					end, "Code Action")

					map("K", function()
						vim.lsp.buf.hover()
					end, "Hover Documentation")

					map("gD", function()
						vim.lsp.buf.declaration()
					end, "Goto Declaration") -- WARN: this is different to goto definition, this is goto declaration
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, formatters or {})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

			local null_ls = require("null-ls")

			local sources = {}
			for _, formatter in ipairs(formatters) do
				sources[#sources + 1] = null_ls.builtins.formatting[formatter]
			end

			null_ls.setup({
				sources = sources or {},
			})
		end,
	},
}
