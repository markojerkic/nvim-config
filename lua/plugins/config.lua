return {
    {
        dir = "~/dev/per-project-config.nvim",
        lazy = false,
        name = "per-project-config.nvim",
        config = function()
            require("per-project-config").loadForCurrentProject()
        end
    }
}
