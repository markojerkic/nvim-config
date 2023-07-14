function setup_zenmode(width)
    width = width or .65
    require("zen-mode").setup {
        window = {
            width = width,
            options = {}
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
    ColourMyPencils()
end

vim.keymap.set("n", "<leader>zz", function()
    setup_zenmode(.65)
end)

vim.keymap.set("n", "<leader>zZ", function()
    setup_zenmode(.80)
end)
