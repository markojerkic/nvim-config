vim.api.nvim_create_user_command('BufOnly', function()
    vim.cmd("silent exec 'wa! | %bd! | e#'")
end, {})
