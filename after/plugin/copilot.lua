vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.api.nvim_set_keymap("i", "<C-p>", 'copilot#Previous()', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-n>", 'copilot#Next()', { silent = true, expr = true })

vim.api.nvim_set_keymap("i", "<C-e>", 'copilot#Cancel()', { silent = true, expr = true })
