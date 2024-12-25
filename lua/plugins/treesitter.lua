return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        build = ":TSUpdate",
        lazy = false,
        init = function()
            -- Only start treesitter after filetype is set
            vim.api.nvim_create_autocmd({ "FileType" }, {
                pattern = { "go" },
                callback = function()
                    vim.treesitter.start()
                    vim.schedule(function()
                        vim.cmd("TSEnable highlight")
                    end)
                end
            })
        end,
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            ensure_installed = {
                -- your existing ensure_installed table...
            },
            sync_install = true,
        },
        config = function(i, opts)
            if type(opts.ensure_installed) == "table" then
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            local configs = require("nvim-treesitter.configs")
            configs.setup(opts)
            vim.schedule(function()
                require("lazy").load({ plugins = { "nvim-treesitter-textobjects" } })
            end)
        end,
    },
    {
        "davidmh/mdx.nvim",
        config = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" }
    },
    {
        "nvim-treesitter/playground"
    }

}
