return {
    {
        "folke/tokyonight.nvim",
    },
    {
        "catppuccin/nvim",
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
        lazy = false,
    },
    {
        "olivercederborg/poimandres.nvim",
    },
    {
        "rebelot/kanagawa.nvim",
    }
}
