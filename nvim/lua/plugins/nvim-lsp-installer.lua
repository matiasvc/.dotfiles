local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },

  max_concurrent_installers = 4,
}


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- LSP Server specific settings
local lsp_settings = {}
lsp_settings['pyright'] = {
  python = {
    pythonPath = "mc_python"
  }
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    settings = lsp_settings[server.name],
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }

  server:setup(opts)
end)
