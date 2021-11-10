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
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip'
    },
    config = function()
      require 'plugins.lspconfig'
    end
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

  -- nvim-lspconfig
  use {
    "neovim/nvim-lspconfig",
    'williamboman/nvim-lsp-installer',
    config = function()
      require 'plugins.lspconfig'
    end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

