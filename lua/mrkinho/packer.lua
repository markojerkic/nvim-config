-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({
        'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
    })
    use({
        'nvim-treesitter/playground', { run = ':TSInstall query' }
    })

    use({ 'theprimeagen/harpoon', requires = ({ 'nvim-lua/plenary.nvim' }) })
    use({ 'mbbill/undotree' })
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use "lewis6991/gitsigns.nvim"

    -- Colorschemes
    use "ellisonleao/gruvbox.nvim"
    use "bluz71/vim-nightfly-colors"
    use "edeneast/nightfox.nvim"
    use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"
    use "folke/tokyonight.nvim"
    use "sheerun/vim-polyglot"
    use "pineapplegiant/spaceduck"
    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }
    use "nanotech/jellybeans.vim"
    use "cocopon/iceberg.vim"
    use "ayu-theme/ayu-vim"
end)
