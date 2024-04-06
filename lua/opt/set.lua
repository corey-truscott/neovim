-- adds relativenumber lines on the side
vim.opt.nu = true
vim.opt.relativenumber = true

-- changes tabs to 2 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- disables wrap
vim.opt.wrap = false

-- disables swap, backup, etc
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- adds persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

-- adds highlighted search, incremental search, and removes case sensetive search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- adds full-colour terminal support
vim.opt.termguicolors = true

-- scrolloff
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- enables signcolumn (i believe this is for lsp?)
vim.opt.signcolumn = "yes"

-- recognise file name
vim.opt.isfname:append("@-@")

-- updates autocompletion faster
vim.opt.updatetime = 50

-- makes vim clipboard the same as system
vim.opt.clipboard = "unnamedplus"

-- marks conceal level as 0
vim.opt.conceallevel = 3

-- encodes files in utf-8
vim.opt.fileencoding = "utf-8"

-- enables mouse
vim.opt.mouse = "a"

-- floating window pop up height
vim.opt.pumheight = 10

-- removes the mode from the status line,
-- this is handled by lualine instead
vim.opt.showmode = false

-- changes where panes split to
vim.opt.splitbelow = true
vim.opt.splitright = true

-- adds a highlight for the selected line
vim.opt.cursorline = true

-- change gutter space
vim.opt.numberwidth = 4
