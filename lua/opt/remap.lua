-- map leader
vim.g.mapleader = " "

-- toggles file tree
--[[ vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle) ]]

-- allows lines to be moved in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join keeps you at the same place in the line
vim.keymap.set("n", "J", "mzJ`z")

-- centers vim when going up/down a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- centers vim when going next/previous in a list
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- changes <C-c> to be the same as <Esc>
vim.keymap.set("i", "<C-c>", "<Esc>")

-- removes the satanic function of Q
vim.keymap.set("n", "Q", "<nop>")

-- formats (requires a formatter to be installed via :Mason)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- makes current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = false })

-- allows for pane navigation via <C-(h,j,k,l)>
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")
