return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context"
        },
        build = ":TSUpdate",
        branch = "main",
        lazy = false,
        config = function()
            require 'nvim-treesitter'.setup({
                ensure_installed = { "javascript", "typescript", "tsx", "java", "c", "lua", "vim" },
            })
        end,
    }
}
