-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    use(
        'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }
    )
    use("nvim-treesitter/nvim-treesitter-context");
    -- use("nvim-treesitter/nvim-treesitter-angular", { commit = '2bb9bb73' });
    use({ "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" })

    use(
        'nvim-treesitter/playground', { run = ':TSInstall query' }
    )

    use({ 'theprimeagen/harpoon', requires = ({ 'nvim-lua/plenary.nvim' }) })
    use({ 'mbbill/undotree' })
    use 'tpope/vim-fugitive'

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
            require('Comment').setup({
                pre_hook = function(ctx)
                    local U = require "Comment.utils"

                    local status_utils_ok, utils = pcall(require, "ts_context_commentstring.utils")
                    if not status_utils_ok then
                        return
                    end

                    local location = nil
                    if ctx.ctype == U.ctype.block then
                        location = utils.get_cursor_location()
                    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                        location = utils.get_visual_start_location()
                    end

                    local status_internals_ok, internals = pcall(require, "ts_context_commentstring.internals")
                    if not status_internals_ok then
                        return
                    end

                    return internals.calculate_commentstring {
                        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
                        location = location,
                    }
                end
            })
        end
    }

    use {
        'JoosepAlviste/nvim-ts-context-commentstring'
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
    use "rebelot/kanagawa.nvim"

    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }

    -- use {
    --     "themaxmarchuk/tailwindcss-colors.nvim",
    --     -- load only on require("tailwindcss-colors")
    --     module = "tailwindcss-colors",
    -- }

    -- use({
    --     "roobert/tailwindcss-colorizer-cmp.nvim",
    --     -- optionally, override the default options:
    --     config = function()
    --         require("tailwindcss-colorizer-cmp").setup({
    --             color_square_width = 2,
    --         })
    --     end
    -- })
    -- use 'NvChad/nvim-colorizer.lua'

    use { 'mrshmllow/document-color.nvim', config = function()
        require("document-color").setup {
            -- Default options
            mode = "background", -- "background" | "foreground" | "single"
        }
    end
    }

    use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }

    use 'mfussenegger/nvim-jdtls'

    -- Prettier
    use "prettier/vim-prettier"

    -- Prisma
    use 'prisma/vim-prisma'

    -- LaTex
    use 'lervag/vimtex'

    -- Zen mode
    use 'folke/zen-mode.nvim'
    -- Astro
    use 'wuelnerdotexe/vim-astro'

    -- Databse
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'kristijanhusak/vim-dadbod-completion'
end)
