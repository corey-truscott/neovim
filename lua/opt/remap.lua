-- stylua: ignore start
--
-- map leader
-- must happen *before* plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- allows lines to be moved in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move lines down in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move lines up in visual mode" })

-- join keeps you at the same place in the line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- centers vim when going up/down a half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half a page" })

-- centers vim when going up/down a page
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Down a page" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Up a page" })

-- centers vim when going next/previous in a list
vim.keymap.set("n", "n", "nzzzv", { desc = "Next item" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous item" })

-- Open Lazy
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- allows for pane navigation via <C-(h,j,k,l)>
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Right pane" })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Down pane" })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Up pane" })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Left pane" })

-- clear highlight search on escsape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Remove search highlight when pressing escape" })

-- navigate buffers
vim.keymap.set("n", "<leader>]b", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>[b", ":bprevious<CR>", { desc = "Previous buffer" })

-- stay in visual mode when indenting with >> or <<
vim.keymap.set("v", "<", "<gv", { desc = "Reindent while staying in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Reindent while staying in visual mode" })
-- stylua: ignore end

local default_scrolloff = vim.o.scrolloff
local alternate_scrolloff = 999
local scrolloff_is_default = true

vim.keymap.set("n", "<leader>cc", function()
    scrolloff_is_default = not scrolloff_is_default
    if scrolloff_is_default then
        vim.opt.scrolloff = alternate_scrolloff
    else
        vim.opt.scrolloff = default_scrolloff
    end
end, { desc = "Toggle centered cursor" })

local function comment_above_or_below(lnum)
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local comment_row = row + lnum
    local l_cms, r_cms = string.match(vim.bo.commentstring, "(.*)%%s(.*)")
    l_cms = vim.trim(l_cms)
    r_cms = vim.trim(r_cms)
    if #r_cms ~= 0 then
        r_cms = " " .. r_cms
    end
    vim.api.nvim_buf_set_lines(
        0,
        comment_row,
        comment_row,
        false,
        { l_cms .. " " .. r_cms }
    )
    vim.api.nvim_win_set_cursor(0, { comment_row + 1, 0 })
    vim.api.nvim_command("normal! ==")
    vim.api.nvim_win_set_cursor(
        0,
        { comment_row + 1, #vim.api.nvim_get_current_line() - #r_cms - 1 }
    )
    vim.api.nvim_feedkeys("a", "ni", true)
end

vim.keymap.set("n", "gco", function()
    comment_above_or_below(0)
end, { desc = "Comment below" })

vim.keymap.set("n", "gcO", function()
    comment_above_or_below(-1)
end, { desc = "Comment above" })
