--
-- if you want to ensure daps are installed, you can
-- list them here. just follow how they are formatted.
--
-- otherwise, use :DapInstall or :Mason to install them, but they wont
-- carry over if you copy your configuration to another computer.
--

local ensure_installed = {
    -- "debugpy",
    -- "delve",
}

return {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
        {
            "jay-babu/mason-nvim-dap.nvim",
            dependencies = { "williamboman/mason.nvim" },
            cmd = { "DapInstall", "DapUninstall" },
            opts = { ensure_installed = ensure_installed or {}, handlers = {} },
        },

        {
            "rcarriga/nvim-dap-ui",
            lazy = true,
            dependencies = {
                { "nvim-neotest/nvim-nio", lazy = true },
            },
            opts = { floating = { border = "rounded" } },
        },

        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },
    keys = function()
        local keys = {}

        --- add a key mapping.
        --- @param map string: the key mapping
        --- @param command function | string: the function or command to execute
        --- @param description string: the description of the key mapping
        local add_key = function(map, command, description)
            table.insert(keys, {
                map,
                command,
                desc = description .. " (DAP)",
            })
        end

        add_key("<Leader>dc", function()
            require("dap").continue()
        end, "Continue")

        add_key("<Leader>db", function()
            require("dap").toggle_breakpoint()
        end, "Toggle Breakpoint")

        add_key("<leader>dso", function()
            require("dap").step_over()
        end, "Step Over")

        add_key("<leader>dsi", function()
            require("dap").step_into()
        end, "Step Into")

        add_key("<leader>dsO", function()
            require("dap").step_out()
        end, "Step Out")

        add_key("<leader>dp", function()
            require("dap").pause()
        end, "Pause")

        add_key("<leader>dq", function()
            require("dap").terminate()
        end, "Terminate")

        add_key("<Leader>du", function()
            require("dapui").toggle()
        end, "Toggle UI")

        add_key("<Leader>?", function()
            require("dapui").eval()
        end, "Evaluate Expression")

        return keys
    end,
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- set up dap-ui
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
}
