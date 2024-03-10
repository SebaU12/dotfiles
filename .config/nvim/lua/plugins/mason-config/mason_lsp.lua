local mason_lsp = require("mason-lspconfig")
mason_lsp.setup {
  ensure_installed = {
    'clangd', 'gopls', 'bashls'
  },
}
