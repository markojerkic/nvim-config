local M = {}

M.colourMyPencils = function(colour)
    colour = colour or vim.g.colors_name
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

M.uncolourMyPencils = function(colour)
    colour = colour or vim.g.colors_name
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(100, "Normal", {})
    vim.api.nvim_set_hl(100, "NormalFloat", {})
end

vim.api.nvim_create_user_command('ColorMyPencils', function()
    M.colourMyPencils()
end, {})
vim.api.nvim_create_user_command('UncolorMyPencils', function()
    M.uncolourMyPencils()
end, {})

return M
