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
  use 'tpope/vim-surround'

  -- LSP

  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
          ui = {
              icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
              }
          }
      })
    end
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "awk_ls",
          "cmake",
          "clangd",
          "pyright",
          "rust_analyzer",
          "sumneko_lua",
          "tsserver",
          "zls"
        }
      })
    end
  }

  use {
    "neovim/nvim-lspconfig",
    after = {"mason.nvim", "mason-lspconfig.nvim"},
    config = function()
      require("plugins.nvim-lspconfig")
    end
  }

  -- LSP Pictograms
  -- use {
  --   'onsails/lspkind-nvim',
  --   config = function()
  --     require 'plugins.lspkind-nvim'
  --   end
  -- }

  -- LSP Status
  -- use {
  --   'nvim-lua/lsp-status.nvim',
  --   config = function()
  --     require 'plugins.lsp-status-nvim'
  --   end
  -- }

  -- Completion
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   requires = {
  --     'hrsh7th/cmp-nvim-lsp',     -- nvim-cmp source for neovim builtin LSP client
  --     'hrsh7th/cmp-nvim-lua',     -- nvim-cmp source for nvim lua
  --     'hrsh7th/cmp-buffer',       -- nvim-cmp source for buffer words
  --     'hrsh7th/cmp-path',         -- nvim-cmp source for filesystem paths
  --     'hrsh7th/cmp-cmdline',      -- nvim-cmp source for vim's commands
  --     'hrsh7th/cmp-git',          -- nvim-cmp source for git
  --     'hrsh7th/cmp-calc',         -- nvim-cmp source for math calculations
  --     'saadparwaiz1/cmp_luasnip', -- luasnip completion source for nvim-cmp
  --     'hrsh7th/cmp-vsnip',
  --     'hrsh7th/vim-vsnip',
  --   },
  --   config = function()
  --     require 'plugins.nvim-cmp'
  --   end
  -- }

  -- Treesitter
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate',
  --   config = function()
  --     require 'plugins.nvim-treesitter'
  --   end
  -- }

  -- Context
  -- use {
  --   'lewis6991/nvim-treesitter-context',
  --   after = 'nvim-treesitter',
  --   config = function()
  --     require 'plugins.nvim-treesitter-context'
  --   end
  -- }

  -- TabNine
  -- use {
  --   'tzachar/cmp-tabnine',
  --   run='./install.sh',
  --   requires = 'hrsh7th/nvim-cmp',
  --   config = function ()
  --     require 'plugins.cmp-tabnine'
  --   end
  -- }

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
    branch = "dev",
    config = function()
      require("auto-save").setup {}
    end
  }

  -- Comments
  use {
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
    end
  }

  -- Scrollbar
  use {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  }

  -- Smooth scrolling
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require 'plugins.neoscroll'
    end
  }

  -- Git
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('vgit').setup()
    end
  }

  -- GitHub
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  -- File Explorer & File Picker
  use {
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup() end
  }

end, config = {
  -- Move to lua dir so impatient.nvim can cache it
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
  }
}
