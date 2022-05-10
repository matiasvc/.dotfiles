local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Ensure packer is installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup{function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'marko-cerovac/material.nvim'

  -- Utils
  use 'tpope/vim-eunuch'
  use 'tpope/vim-obsession'

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require 'plugins.nvim-lspconfig'
    end
  }
  
  -- LSP Installer
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require 'plugins.nvim-lsp-installer'
    end
  }

  -- LSP Pictograms
  use {
    'onsails/lspkind-nvim',
    config = function()
      require 'plugins.lspkind-nvim'
    end
  }

  -- LSP Status
  use {
    'nvim-lua/lsp-status.nvim',
    config = function()
      require 'plugins.lsp-status-nvim'
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',     -- nvim-cmp source for neovim builtin LSP client
      'hrsh7th/cmp-nvim-lua',     -- nvim-cmp source for nvim lua
      'hrsh7th/cmp-buffer',       -- nvim-cmp source for buffer words
      'hrsh7th/cmp-path',         -- nvim-cmp source for filesystem paths
      'hrsh7th/cmp-cmdline',      -- nvim-cmp source for vim's commands
      'hrsh7th/cmp-git',          -- nvim-cmp source for git
      'hrsh7th/cmp-calc',         -- nvim-cmp source for math calculations
      'saadparwaiz1/cmp_luasnip', -- luasnip completion source for nvim-cmp
    },
    config = function()
      require 'plugins.nvim-cmp'
    end
  }

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets",   -- Snippets collection
    },
    config = function()
      require 'plugins.luasnip'
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plugins.nvim-treesitter'
    end
  }

  -- Autopairs
  -- use {
  --   'windwp/nvim-autopairs',
  --   event = 'InsertEnter',
  --   config = function()
  --     require 'plugins.nvim-autopairs'
  --   end
  -- }

  -- Status line
  -- use {
  --   'hoob3rt/lualine.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function()
  --     require 'plugins.lualine'
  --   end
  -- }

  -- Buffer line
  -- use {
  --   'akinsho/bufferline.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   keys = { '<leader>sb' },
  --   config = function()
  --     require 'plugins.bufferline'
  --   end
  -- }

  -- Aerial
  -- use {
  --   'stevearc/aerial.nvim'
  -- }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'plugins.telescope'
    end
  }

  -- Autosave
  use {
    "Pocco81/AutoSave.nvim",
    config = function()
      require 'plugins.autosave'
    end
  }

  -- Comments
  use {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  }

  -- Scrollbar
  -- use {
  --   "petertriho/nvim-scrollbar",
  --   config = function()
  --     require("scrollbar").setup()
  --   end
  -- }

  -- Smooth scrolling
  -- use {
  --   'karb94/neoscroll.nvim',
  --   config = function()
  --     require 'plugins.neoscroll'
  --   end
  -- }

  -- CMake
  -- use {
  --   "cdelledonne/vim-cmake",
  --   config = function()
  --     require 'plugins.vim-cmake'
  --   end
  -- }


  -- Git
  -- use {
  --   'tanvirtin/vgit.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('vgit').setup()
  --   end
  -- }

  -- GitHub
  -- use {
  --   'pwntester/octo.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   config = function ()
  --     require"octo".setup()
  --   end
  -- }


end, config = {
  -- Move to lua dir so impatient.nvim can cache it
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
  }
}
