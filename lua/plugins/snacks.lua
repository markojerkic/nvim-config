---@class snacks.Config
---@field bigfile? snacks.bigfile.Config | { enabled: boolean }
---@field gitbrowse? snacks.gitbrowse.Config
---@field lazygit? snacks.lazygit.Config
---@field notifier? snacks.notifier.Config | { enabled: boolean }
---@field quickfile? { enabled: boolean }
---@field statuscolumn? snacks.statuscolumn.Config  | { enabled: boolean }
---@field styles? table<string, snacks.win.Config>
---@field dashboard? snacks.dashboard.Config  | { enabled: boolean }
---@field terminal? snacks.terminal.Config
---@field toggle? snacks.toggle.Config
---@field win? snacks.win.Config
---@field words? snacks.words.Config
local config = {
    dashboard = {
        enabled = true,

        sections = {
            {
                section = "terminal",
                cmd = "chafa ~/lockscreen.png --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
                height = 17,
                padding = 1,
            },
            {
                pane = 2,
                { section = "keys",   gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
}

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = config,
}
