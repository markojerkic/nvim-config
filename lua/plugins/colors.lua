return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        -- optionally set the colorscheme within lazy config
        init = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
            local util = require("marko.util.colors")
            util.colourMyPencils()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
    }
}
