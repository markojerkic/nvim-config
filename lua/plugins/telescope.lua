return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('marko.config.telescope')
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim'
    }
}
