-- :ab ifmain def main():<CR>assert False<CR><CR><BS>if __name__ == \"__main__\":<CR>main()<ESC>3kb
-- i dont think theres a way to do this with lua directly
vim.cmd("ab ifmain def main():<CR>assert False<CR><CR><BS>if __name__ == \"__main__\":<CR>main()<ESC>3kb")
