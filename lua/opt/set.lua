-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- changes tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- disables wrap
vim.opt.wrap = false

-- disables swap, backup, etc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- adds persistent undo
vim.opt.undodir = vim.env.XDG_CONFIG_HOME or vim.env.HOME .. "/.config"
vim.opt.undofile = true

-- adds highlighted search, incremental search, and removes case sensetive search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- adds full-colour terminal support
vim.opt.termguicolors = true

-- scrolloff
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

-- enables signcolumn
vim.opt.signcolumn = "yes"

-- recognise file name
vim.opt.isfname:append("@-@")

-- updates autocompletion faster
vim.opt.updatetime = 50

-- makes vim clipboard the same as system
vim.opt.clipboard = "unnamedplus"

-- marks conceal level as 3
vim.opt.conceallevel = 3

-- encodes files in utf-8
vim.opt.fileencoding = "utf-8"

-- enables mouse
vim.opt.mouse = "a"

-- floating window pop up height (completion only provides 10 options without scrolling)
vim.opt.pumheight = 10

-- removes the mode from the status line,
vim.opt.showmode = false

-- changes where panes split to
vim.opt.splitbelow = true
vim.opt.splitright = true

-- adds a highlight for the selected line
vim.opt.cursorline = true

-- change gutter space
vim.opt.numberwidth = 4

-- color column on char 80
vim.opt.colorcolumn = "80"

-- preview substitution
vim.opt.inccommand = "split"

-- stop o/O from inserting a new comment on the next line
vim.opt.formatoptions:remove("o")

-- allow cursor to move where there is no text in visual block mode
vim.opt.virtualedit = "block"

-- flash text that gets yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            timeout = 100,
        })
    end,
})

-- create directory when saving a file if it doesnt already exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = vim.api.nvim_create_augroup(
        "Auto create directories",
        { clear = true }
    ),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        ---@diagnostic disable-next-line: undefined-field
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})
