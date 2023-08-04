return {
  -- Shows scope context of the current line
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup()
    end
  }
}
