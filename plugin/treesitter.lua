vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
        if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
        vim.cmd('TSUpdate')
    end
end })

vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = main,
    },

    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/windwp/nvim-ts-autotag",
})

vim.api.nvim_create_autocmd("FileType", { -- enable treesitter highlighting and indents
    callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.treesitter.start()
        end
    end
})

require("treesitter-context").setup({
    max_lines = 3,
    multiline_threshold = 1,
    separator = '-',
    min_window_height = 20,
    line_numbers = true,
})

require('nvim-ts-autotag').setup({
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false
    },
    -- per_filetype = {
    --   ["html"] = {
    --     enable_close = false
    --   }
    -- }
})
