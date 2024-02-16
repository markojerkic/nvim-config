local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', function()
  builtin.find_files(require('telescope.themes').get_dropdown({
    layout_config = {
      width = 0.9
    }
  }))
end, {})

vim.keymap.set('n', '<leader>pg', function()
  builtin.live_grep(require('telescope.themes').get_dropdown({
    layout_config = {
      width = 0.9
    }
  }))
end, {})

vim.keymap.set('n', '<leader>pf', function()
  builtin.git_files(require('telescope.themes').get_dropdown({
    layout_config = {
      width = 0.9
    }
  }))
end, {})

vim.keymap.set('n', '<leader>pp', builtin.help_tags, {})
