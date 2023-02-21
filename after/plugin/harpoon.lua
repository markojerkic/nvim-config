local opts = { noremap = true, silent = true }
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- Shorten function name
local keymap = vim.keymap.set

keymap("n", "<leader>h", ui.toggle_quick_menu, opts)
keymap("n", "<leader>a", mark.add_file, opts)

keymap("n", "<leader>1", function() ui.nav_file(1) end, opts)
keymap("n", "<leader>2", function() ui.nav_file(2) end, opts)
keymap("n", "<leader>3", function() ui.nav_file(3) end, opts)
keymap("n", "<leader>4", function() ui.nav_file(4) end, opts)
keymap("n", "<leader>5", function() ui.nav_file(5) end, opts)
keymap("n", "<leader>6", function() ui.nav_file(6) end, opts)
keymap("n", "<leader>7", function() ui.nav_file(7) end, opts)
keymap("n", "<leader>8", function() ui.nav_file(8) end, opts)
keymap("n", "<leader>9", function() ui.nav_file(9) end, opts)

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 120,
    }
})
