local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({ "jdtls", 'tsserver', 'tailwindcss-language-server' })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = ""
  }
})

function Lsp_keymap(opts)
  local telescope = require('telescope.builtin')
  vim.keymap.set("n", "gd", function() telescope.lsp_definitions() end, opts)
  vim.keymap.set("n", "<leader>gr", function() telescope.lsp_references() end, opts)
  vim.keymap.set("n", "<leader>gi", function() telescope.lsp_implementations() end, opts)

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<A-l>", function() vim.lsp.buf.format() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set({ "v", "n" }, "<leader>ca", require("actions-preview").code_actions)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


  vim.keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
  vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
  vim.keymap.set('n', '<leader>bl', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
  vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')

  vim.keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>')
  vim.keymap.set('n', '<leader>dso', ':lua require"dap".step_over()<CR>')
  vim.keymap.set('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')
  vim.keymap.set('n', '<leader>dsso', ':lua require"dap".step_out()<CR>')
end

local function attach_keymap(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  Lsp_keymap(opts)

  if client.server_capabilities.colorProvider then
    -- Attach document colour support
    require("document-color").buf_attach(bufnr)
  end
end

lsp.on_attach(attach_keymap)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

local function attach_tailwind(client, bufnr)
  if client.server_capabilities.colorProvider then
    -- Attach document colour support
    require("document-color").buf_attach(bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- You are now capable!
capabilities.textDocument.colorProvider = {
  dynamicRegistration = true
}

-- Lsp servers that support documentColor
require("lspconfig").tailwindcss.setup({
  on_attach = attach_tailwind,
  capabilities = capabilities
})
