local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

--[[ Usage:
use {
  'myusername/example',        -- The plugin location string
  -- The following keys are all optional
  disable = boolean,           -- Mark a plugin as inactive
  as = string,                 -- Specifies an alias under which to install the plugin
  installer = function,        -- Specifies custom installer. See "custom installers" below.
  updater = function,          -- Specifies custom updater. See "custom installers" below.
  after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,               -- Manually marks a plugin as optional.
  branch = string,             -- Specifies a git branch to use
  tag = string,                -- Specifies a git tag to use
  commit = string,             -- Specifies a git commit to use
  lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  config = string or function, -- Specifies code to run after this plugin is loaded.
  -- The setup key implies opt = true
  setup = string or function,  -- Specifies code to run before this plugin is loaded.
  -- The following keys all imply lazy-loading and imply opt = true
  cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
  ft = string or list,         -- Specifies filetypes which load this plugin.
  keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
  event = string or list,      -- Specifies autocommand events which load this plugin.
  fn = string or list          -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                               -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
  requiring a string which matches one of these patterns, the plugin will be loaded.
}
--]]

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
  use {
    'hoob3rt/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = 'BufWinEnter',
    config = function()
      require 'plugins.lualine'
    end
  }

  -- Buffer line
  --[[
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    keys = { '<leader>sb' },
    config = function()
      require 'plugins.bufferline'
    end
  }
  ]]--

  -- Code outline
  use {
     'simrat39/symbols-outline.nvim',
     config = function()
       require 'plugins.symbols-outline'
     end
  }

  -- Telescope
  --[[
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
  ]]--

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
