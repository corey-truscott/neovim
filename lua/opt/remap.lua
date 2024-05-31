-- map leader
-- must happen *before* plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- allows lines to be moved in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- join keeps you at the same place in the line
vim.keymap.set("n", "J", "mzJ`z")

-- centers vim when going up/down a half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- centers vim when going up/down a page
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- centers vim when going next/previous in a list
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- change Q to make lines equal
vim.keymap.set("n", "Q", "gql")

-- Open Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- allows for pane navigation via <C-(h,j,k,l)>
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>")

-- clear highlight search on escsape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

local defaultScrollOff = vim.o.scrolloff
local alternateScrollOff = 999
local scrollOff = { defaultScrollOff, alternateScrollOff }

vim.keymap.set("n", "<leader>cc", function()
    scrollOff[1], scrollOff[2] = scrollOff[2], scrollOff[1]
    vim.opt.scrolloff = scrollOff[1]
    if scrollOff[1] == alternateScrollOff then
        vim.cmd("exe 'normal! zz'")
    end
end, { desc = "Toggle centered cursor" })
