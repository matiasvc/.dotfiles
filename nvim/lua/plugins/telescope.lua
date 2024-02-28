return {
  -- Setup telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "telescope.nvim",
      dependencies = {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files({}) end,
        desc = "Find files in the current directory",
      },
      {
        "<leader>fg",
        function() require("telescope.builtin").git_files({}) end,
        desc = "Find files in the current Git repository",
      },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Search for a specific string in the project",
      },
      {
        "<leader>fb",
        function() require("telescope.builtin").buffers({}) end,
        desc = "List and select from open buffers",
      },
      {
        "<leader>fr",
        function() require("telescope.builtin").oldfiles({}) end,
        desc = "Access recently used files",
      },
      {
        "<leader>fh",
        function() require("telescope.builtin").help_tags({}) end,
        desc = "Browse help tags",
      },
      {
        "<leader>fo",
        function() require("telescope.builtin").vim_options({}) end,
        desc = "Find and adjust Vim options",
      },
      {
        "<leader>fc",
        function() require("telescope.builtin").current_buffer_fuzzy_find({}) end,
        desc = "Fuzzy find within the current buffer",
      },
      {
        "<leader>fm",
        function() require("telescope.builtin").man_pages({}) end,
        desc = "Access man pages",
      },
      {
        "<leader>ft",
        function() require("telescope.builtin").treesitter({}) end,
        desc = "Explore TreeSitter syntax nodes",
      },
      {
        "<leader>fu",
        function() require("telescope.builtin").grep_string({}) end,
        desc = "Find usage of a string in the project",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  }
}
