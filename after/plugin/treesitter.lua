require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "javascript", "typescript", "tsx", "java", "c", "lua", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    enable = true,
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
      -- true if location of file contains 'UagDai' in path
      if vim.api.nvim_buf_get_name(buf):find("/tmp") then
        return true
      end

      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

}

require('ts_context_commentstring').setup {
  enable = true,
  -- enable_autocmd = false,
  config = {
    -- javascript = {
    --   __default = '// %s',
    --   jsx_element = '{/* %s */}',
    --   jsx_fragment = '{/* %s */}',
    --   jsx_attribute = '// %s',
    --   comment = '// %s',
    -- },
    typescript = {
      __default = '{/* %s */}',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s',
    },
    -- tsx = {
    --   __default = '// %s',
    --   tsx_element = '{/* %s */}',
    --   tsx_fragment = '{/* %s */}',
    --   tsx_attribute = '// %s',
    --   comment = '// %s',
    -- },
  }
}
vim.g.skip_ts_context_commentstring_module = true
