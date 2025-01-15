return {
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>dl", function()
                dapui.setup()
                dapui.toggle()
            end, {})

            vim.fn.sign_define('DapBreakpoint', { text = '' })
        end,
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    }
}
