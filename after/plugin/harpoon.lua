-- require("harpoon").setup({
--     menu = {
--         width = vim.api.nvim_win_get_width(0) - 10,
--     }
-- })

local harpoon = require("harpoon")
local keymap = vim.keymap.set

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

keymap("n", "<leader>1", function() harpoon:list():select(1) end, opts)
keymap("n", "<leader>2", function() harpoon:list():select(2) end, opts)
keymap("n", "<leader>3", function() harpoon:list():select(3) end, opts)
keymap("n", "<leader>4", function() harpoon:list():select(4) end, opts)
keymap("n", "<leader>5", function() harpoon:list():select(5) end, opts)
keymap("n", "<leader>6", function() harpoon:list():select(6) end, opts)
keymap("n", "<leader>7", function() harpoon:list():select(7) end, opts)
keymap("n", "<leader>8", function() harpoon:list():select(8) end, opts)
keymap("n", "<leader>9", function() harpoon:list():select(9) end, opts)


-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
