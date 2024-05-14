return {
    {
        "folke/tokyonight.nvim",
    },
    { "catppuccin/nvim", name = "catppuccin" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme rose-pine]])
            local util = require("marko.util.colors")
            util.colourMyPencils()
        end
    }
}
