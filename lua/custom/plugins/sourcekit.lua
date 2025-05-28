return {
  'neovim/nvim-lspconfig',
  require('lspconfig').sourcekit.setup {
    filetypes = {
      'swift',
    },
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
        interFileDependencies = true,
        workspaceDiagnostics = false,
      },
    },
  },
}
