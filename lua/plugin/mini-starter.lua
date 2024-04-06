-- start screen
return {
    -- enable mini.starter
    {
        "echasnovski/mini.starter",
        event = "VimEnter",
        opts = function()
            local logo = table.concat({
                [[                                  __]],
                [[     ___     ___    ___   __  __ /\_\    ___ ___]],
                [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
                [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
                [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }, "\n")
            local pad = string.rep(" ", 22)
            local new_section = function(name, action, section)
                return { name = name, action = action, section = pad .. section }
            end

            local starter = require("mini.starter")
            --stylua: ignore
            local config = {
                evaluate_single = true,
                header = logo,
                items = {
                    new_section("Find file", "Telescope find_files", "Telescope"),
                    new_section("Recent files", "Telescope oldfiles", "Telescope"),
                    new_section("Grep text", "Telescope live_grep", "Telescope"),
                    new_section("User options", "e ~/.config/nvim/lua/user_opts/init.lua", "Config"),
                    new_section("Lazy", "Lazy", "Config"),
                    new_section("Neorg", "Neorg workspace main", "Notes"),
                    new_section("Quit", "qa", "Built-in"),
                    new_section("Session restore", [[lua require("persistence").load()]], "Session"),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(pad .. "░ ", false),
                    starter.gen_hook.aligning("center", "center"),
                },
            }
            return config
        end,
        config = function(_, config)
            -- close Lazy and re-open when starter is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "MiniStarterOpened",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            local starter = require("mini.starter")
            starter.setup(config)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local pad_footer = string.rep(" ", 8)
                    starter.config.footer = pad_footer .. "Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(starter.refresh)
                end,
            })
        end,
    },
}
