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

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    'williamboman/nvim-lsp-installer',
    config = function()
      require 'plugins.lspconfig'
    end
  }

  -- Completion engine
  -- TODO: Configs for all of these
  use {
      'hrsh7th/nvim-cmp',
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
        'saadparwaiz1/cmp_luasnip', -- Requires LuaSnip
        'L3MON4D3/LuaSnip'
      }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'plugins.treesitter'
    end
  }

  -- Autopairs
  use {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'plugins.autopairs'
    end
  }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = 'BufWinEnter',
    config = function()
      require 'plugins.lualine'
    end
  }

  -- Buffer line
  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    opt = true,
    keys = { '<leader>sb' },
    config = function()
      require 'plugin.bufferline'
    end
  }

  -- Code outline
  use {
     'simrat39/symbols-outline.nvim'
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-media-files.nvim',
    },
    event = 'UIEnter',
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

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

