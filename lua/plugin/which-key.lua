return {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				presets = {
					operators = false,
					motions = false,
				},
			})
			local wk = require("which-key")
			local builtin = require("telescope.builtin")
			local harpoon = require("harpoon")
			local trouble = require("trouble")

			wk.register({
				-- lazy
				L = { vim.cmd.Lazy, "lazy" },
				-- neotree
				e = { "<cmd>Neotree toggle<cr>", "file tree" },
				-- trouble and todo comments
				t = {
					t = {
						function()
							trouble.toggle()
						end,
						"toggle trouble",
					},

					j = {
						function()
							trouble.next()
						end,
						"next trouble item",
					},

					k = {
						function()
							trouble.previous()
						end,
						"previous trouble item",
					},

					J = {
						function()
							trouble.next({ skip_groups = true, jump = true })
						end,
						"previous trouble item",
					},

					K = {
						function()
							trouble.previous({ skip_groups = true, jump = true })
						end,
						"previous trouble item",
					},

					n = {
						function()
							require("todo-comments").jump_next()
						end,
						"next todo",
					},
					p = {
						function()
							require("todo-comments").jump_prev()
						end,
						"previous todo",
					},
					f = { vim.cmd.TodoTelescope, "todo find" },
				},
				-- formats (requires formatter installed via :Mason)
				f = { vim.lsp.buf.format, "format" },
				-- makes current file executable
				x = { "<cmd>!chmod +x %<cr>", "make file executable" },
				-- undotree
				u = { vim.cmd.UndotreeToggle, "undotree" },
				-- telescope
				p = {
					name = "telescope",
					-- find files
					v = { builtin.find_files, "find files" },
					-- find buffers
					b = { builtin.buffers, "find buffers" },
					-- grep string search
					s = {
						function()
							builtin.grep_string({ search = vim.fn.input("Grep > ") })
						end,
						"grep string search",
					},
					ws = {
						function()
							builtin.grep_string({ search = vim.fn.expand("<cword>") })
						end,
						"search word",
					},
					Ws = {
						function()
							builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
						end,
						"search word (to whitespace)",
					},
				},
				-- LSP
				l = {
					name = "LSP",
					h = {
						function()
							vim.lsp.buf.hover()
						end,
						"hover",
					},
					s = {
						function()
							vim.lsp.buf.workspace_symbol()
						end,
						"view workspace symbol",
					},
					d = {
						function()
							vim.diagnostic.open_float()
						end,
						"open diagnostic",
					},
					-- j = {
					-- 	function()
					-- 		vim.diagnostic.goto_next()
					-- 	end,
					-- 	"goto next diagnostic",
					-- },
					-- k = {
					-- 	function()
					-- 		vim.diagnostic.goto_prev()
					-- 	end,
					-- 	"goto previous diagnostic",
					-- },
					a = {
						function()
							vim.lsp.buf.code_action()
						end,
						"code action",
					},
					f = {
						function()
							vim.lsp.buf.references()
						end,
						"references",
					},
					r = {
						function()
							vim.lsp.buf.rename()
						end,
						"rename",
					},
					m = { vim.cmd.Mason, "lsp installer" },
				},
				g = {
					name = "git",
					p = { "<cmd>Gitsigns preview_hunk<cr>", "preview hunk" },
					j = { "<cmd>Gitsigns next_hunk<cr>", "next hunk" },
					k = { "<cmd>Gitsigns prev_hunk<cr>", "previous hunk" },
					b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "toggle inline blame" },

					g = { "<cmd>LazyGit<cr>", "lazy git" },
				},
				m = {
					name = "harpoon",
					v = {
						function()
							harpoon.ui:toggle_quick_menu(harpoon:list())
						end,
						"menu",
					},
					a = {
						function()
							harpoon:list():add()
						end,
						"append",
					},
					q = {
						function()
							harpoon:list():select(1)
						end,
						"select one",
					},
					w = {
						function()
							harpoon:list():select(2)
						end,
						"select two",
					},
					e = {
						function()
							harpoon:list():select(3)
						end,
						"select three",
					},
					r = {
						function()
							harpoon:list():select(4)
						end,
						"select four",
					},
				},
				o = {
					vim.cmd.Oil,
					"oil",
				},
			}, { prefix = "<leader>" })
		end,
	},
}
