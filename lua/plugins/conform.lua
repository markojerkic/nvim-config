return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local java_formatter = os.getenv("HOME") ..
            "/.local/share/nvim/mason/packages/google-java-format/google-java-format"

        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua", lsp_format = "fallback" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },

                java = { "google_java_format" },

                -- Conform will run the first available formatter
                javascript = { "biome", "prettier", stop_after_first = true },
                typescript = { "biome", "prettier", stop_after_first = true },
                json = { "biome", "prettier", stop_after_first = true },
                html = { "biome", "prettier", stop_after_first = true },
                css = { "biome", "prettier", stop_after_first = true },
                tsx = { "biome", "prettier", stop_after_first = true },
            },
            formatters = {
                google_java_format = {
                    command = java_formatter,
                    args = { "-" },
                    stdin = true,
                },
            },
            format_after_save = {
                lsp_format = "fallback",
            },
        })
    end

}
