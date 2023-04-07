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

    use(
        'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
    )
    use("nvim-treesitter/nvim-treesitter-context");

    use(
        'nvim-treesitter/playground', { run = ':TSInstall query' }
    )

    use({ 'theprimeagen/harpoon', requires = ({ 'nvim-lua/plenary.nvim' }) })
    use({ 'mbbill/undotree' })
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
            require('nvim-treesitter.configs').setup {
                context_commentstring = {
                    enable = true
                }
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use "lewis6991/gitsigns.nvim"
    use "APZelos/blamer.nvim"

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

    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }

    use {
        "themaxmarchuk/tailwindcss-colors.nvim",
        -- load only on require("tailwindcss-colors")
        module = "tailwindcss-colors",
        -- run the setup function after plugin is loaded
        config = function()
            -- pass config options here (or nothing to use defaults)
            require("tailwindcss-colors").setup()
        end
    }

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    use 'mfussenegger/nvim-jdtls'

    -- Prettier
    use "prettier/vim-prettier"

    -- Prisma
    use 'prisma/vim-prisma'

    -- LaTex
    use 'lervag/vimtex'
end)
