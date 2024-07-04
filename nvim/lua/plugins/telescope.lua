return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {"<C-q>", ":Telescope quickfix<CR>"},
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
    -- Grep for the word under the cursor
    {
      "<leader>fu",
      function() require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") }) end,
      desc = "Grep Word",
    },
    -- Grep a given input string. Allows further filtering of the files that match the grep.
    {
      "<leader>fs",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Search for a specific string in the project",
    },
  }
}
