local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Ensure packer is installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
		vim.api.nvim_command 'packadd packer.nvim'
end

local packer = require 'packer'


return packer.startup(
		function(use)

    -- Theme
		use 'marko-cerovac/material.nvim'

		-- Telescope
		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				{'nvim-lua/popup.nvim'},
				{'nvim-lua/plenary.nvim'},
				{'nvim-telescope/telescope-fzy-native.nvim'},
				{'nvim-telescope/telescope-media-files.nvim'}
			},
			event = 'UIEnter',
			config = function()
				require 'plugins.configs.telescope'
			end
		}

    -- Autosave
    use {
      "Pocco81/AutoSave.nvim",
      config = function()
        require 'plugins.configs.autosave'
      end
    }

end)