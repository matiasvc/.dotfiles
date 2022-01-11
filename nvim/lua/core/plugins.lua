local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Ensure packer is installed
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'marko-cerovac/material.nvim'

  -- Utils
  use 'tpope/vim-eunuch'
  use 'tpope/vim-commentary'

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    -- Config is done in nvim-lsp-installer
  }

  use {
    'williamboman/nvim-lsp-installer',
    --after = {'nvim-lspconfig', 'cmp-nvim-lsp'},
    config = function()
      require 'plugins.nvim-lsp-installer'
    end
  }

  -- Snippets
  use {
      'hrsh7th/vim-vsnip',
      config = function()
        require 'plugins.vim-vsnip'
      end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    after = 'vim-vsnip',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-vsnip', -- Requires vim-vsnip
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-git',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'hrsh7th/vim-vsnip',
      'octaltree/cmp-look',
    },
    config = function()
      require 'plugins.nvim-cmp'
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
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'plugins.nvim-autopairs'
    end
  }

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
  use {
    'stevearc/aerial.nvim'
  }

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
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  }

  -- CMake
  use {
    "cdelledonne/vim-cmake",
    config = function()
      require 'plugins.vim-cmake'
    end
  }

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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

