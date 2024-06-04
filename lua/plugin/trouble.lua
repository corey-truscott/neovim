return {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        focus = true,
        indent_guides = true,
        follow = true,
        auto_refresh = true,
        auto_close = false,
        use_diagnostic_signs = true,
    },

    keys = function()
        local keys = {}

        --- add a key mapping.
        --- @param map string: the key mapping
        --- @param command function | string: the function or command to execute
        --- @param description string: the description of the key mapping
        --- @param extension boolean: add " (Trouble)" to the end
        local add_key = function(map, command, description, extension)
            if extension then
                description = description .. " (Trouble)"
            end
            table.insert(keys, {
                map,
                command,
                desc = description,
            })
        end

        add_key("<leader>tt", function()
            require("trouble").toggle({
                mode = "diagnostics",
                filter = { nil },
            })
        end, "Diagnostics", true)

        add_key("<leader>tT", function()
            require("trouble").toggle({
                mode = "diagnostics",
                filter = { buf = vim.api.nvim_get_current_buf() },
            })
        end, "Filtered diagnostics", true)

        add_key("[q", function()
            if require("trouble").is_open() then
                ---@diagnostic disable-next-line: missing-parameter, missing-fields
                require("trouble").prev({
                    skip_groups = true,
                    jump = true,
                })
            else
                local ok, err = pcall(vim.cmd.cprev)
                if not ok then
                    vim.notify(err, vim.log.levels.ERROR)
                end
            end
        end, "Previous Trouble/Quickfix item", false)

        add_key("]q", function()
            if require("trouble").is_open() then
                ---@diagnostic disable-next-line: missing-parameter, missing-fields
                require("trouble").next({
                    skip_groups = true,
                    jump = true,
                })
            else
                local ok, err = pcall(vim.cmd.cnext)
                if not ok then
                    vim.notify(err, vim.log.levels.ERROR)
                end
            end
        end, "Next Trouble/Quickfix item", false)

        return keys
    end,
}
