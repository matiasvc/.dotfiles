return {
  -- Add auto save plugin
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function ()
      require("auto-save").setup()
    end
  }
}
