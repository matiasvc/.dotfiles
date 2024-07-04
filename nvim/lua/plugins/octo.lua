return {
  -- Octo for GitHub
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
    opts = {
      suppress_missing_scope = {
        projects_v2 = true,
      }
    }
  }
}
