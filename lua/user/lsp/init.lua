local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
require 'lspconfig'.jdtls.setup {
	cmd = { 'jdtls' },
	root_dir = function(fname)
		return require 'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
	end
}


require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
