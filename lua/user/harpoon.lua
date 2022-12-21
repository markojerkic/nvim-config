local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>h", "v:lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>a", "v:lua require('harpoon.mark').add_file()<CR>", opts)

keymap("n", "<leader>1", "v:lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>2", "v:lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>3", "v:lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>4", "v:lua require('harpoon.ui').nav_file(4)<CR>", opts)

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 120,
    }
})
