local builtin = require("telescope.builtin")
local drop_down_theme = require("marko.util.telescope").dropdown

vim.keymap.set("n", "<C-p>", function()
    builtin.find_files(drop_down_theme)
end, {})

vim.keymap.set("n", "<leader>pg", function()
    builtin.live_grep(drop_down_theme)
end, {})

vim.keymap.set("n", "<leader>pf", function()
    builtin.git_files(drop_down_theme)
end, {})

vim.keymap.set("n", "<leader>pc", function()
    builtin.colorscheme(drop_down_theme)
end, {})

vim.keymap.set("n", "<leader>tr", function()
    builtin.resume(drop_down_theme)
end, {})

vim.keymap.set("n", "<leader>t", function()
    vim.cmd("Telescope")
end, {})

vim.keymap.set("n", "<leader>pp", builtin.help_tags, {})

-- Ignore certain files and directories, like .cert and .png, .ico
require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "%.crt$",
            "%.csr$",
            "%.key$",
            "%.lockb$",
            "%.lock$",
            -- .min files
            "%.min%.css$",
            "%.min%.js$",
            "%.cert$",
            "%.ico$",
            "%.png$",
            "%.jpg$",
            "api/v1",
        },
    },
})
