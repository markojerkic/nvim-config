local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Prettier
  use 'jose-elias-alvarez/null-ls.nvim'
  use "prettier/vim-prettier"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Tabs
  use 'nanozuki/tabby.nvim'

  -- Prisma
  use 'pantharshit00/vim-prisma'

  -- Git
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use "lewis6991/gitsigns.nvim"

  -- Harpoon
  use { 'theprimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }

  -- Nerdtree
  use "preservim/nerdtree"

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

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
  }
  use 'mfussenegger/nvim-jdtls' -- maven plugin

  -- Debugger
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"

  -- Telescope
  use "nvim-telescope/telescope.nvim"


  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use 'wuelnerdotexe/vim-astro'
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
