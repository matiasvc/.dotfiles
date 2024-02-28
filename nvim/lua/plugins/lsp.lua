return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- keys[#keys + 1] = { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>" }
      -- keys[#keys + 1] = { "K", "<cmd>lua vim.lsp.buf.hover()<cr>" }
      --
      -- keys[#keys + 1] = { "<leader>ws", "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>" }
      -- keys[#keys + 1] = { "<leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>" }
      --
      -- keys[#keys + 1] = { "[d", "<cmd>lua vim.diagnostic.goto_next()<cr>" }
      -- keys[#keys + 1] = { "]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>" }
      --
      -- keys[#keys + 1] = { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>" }
      -- keys[#keys + 1] = { "<leader>rr", "<cmd>lua vim.lsp.buf.references()<cr>" }
      -- keys[#keys + 1] = { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>" }
      --
      -- keys[#keys + 1] = { "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>" }
    end,
  }
}
