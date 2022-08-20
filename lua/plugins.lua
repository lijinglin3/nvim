return require('packer').startup({
	function(use)
		use {
			'sainnhe/gruvbox-material', config = [[require('configs.gruvbox')]]
		}
		use {
			'phaazon/hop.nvim', config = [[require('configs.hop')]]
		}
		use {
			'kyazdani42/nvim-tree.lua', config = [[require('configs.nvim-tree')]],
			requires = 'kyazdani42/nvim-web-devicons',
		}
		use {
			'nvim-lualine/lualine.nvim', config = [[require('configs.lualine')]],
			requires = 'kyazdani42/nvim-web-devicons',
		}
		use {
			'akinsho/toggleterm.nvim', config = [[require('configs.toggleterm')]]
		}
		use {
			'lewis6991/gitsigns.nvim', config = [[require('configs.gitsigns')]]
		}
		use {
			'nvim-telescope/telescope.nvim', config = [[require('configs.telescope')]],
			requires = {
				'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'nvim-treesitter/nvim-treesitter',
				'nvim-telescope/telescope-frecency.nvim', 'tami5/sqlite.lua',
				'nvim-telescope/telescope-dap.nvim', 'mfussenegger/nvim-dap',
				'nvim-telescope/telescope-project.nvim', 'nvim-telescope/telescope-file-browser.nvim',
				{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			}
		}
		use {
			'hrsh7th/nvim-cmp', config = [[require('configs.cmp')]],
			requires = {
				'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
			}
		}
		use {
			'neovim/nvim-lspconfig', config = [[require('configs.lspconfig')]],
			requires = { 'jose-elias-alvarez/null-ls.nvim', 'nvim-lua/plenary.nvim' }
		}
		use {
			'nvim-treesitter/nvim-treesitter', config = [[require('configs.treesitter')]]
		}
		use {
			'ray-x/go.nvim', config = [[require('configs.go')]],
			requires = { 'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap' }
		}
		use {
			'wbthomason/packer.nvim'
		}
	end,
	config = {
		max_jobs = 16,
		compile_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
	}
})
