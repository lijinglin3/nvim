return require('packer').startup({
	function(use)
		use {
			'sainnhe/gruvbox-material', config = function() require('configs.gruvbox') end
		}
		use {
			'phaazon/hop.nvim', config = function() require('configs.hop') end
		}
		use {
			'kyazdani42/nvim-tree.lua', config = function() require('configs.nvim-tree') end,
			requires = 'kyazdani42/nvim-web-devicons',
		}
		use {
			'nvim-lualine/lualine.nvim', config = function() require('configs.lualine') end,
			requires = 'kyazdani42/nvim-web-devicons',
		}
		use {
			'akinsho/toggleterm.nvim', config = function() require('configs.toggleterm') end
		}
		use {
			'anuvyklack/pretty-fold.nvim', config = function() require('configs.pretty-fold') end
		}
		use {
			'lewis6991/gitsigns.nvim', config = function() require('configs.gitsigns') end
		}
		use {
			'nvim-telescope/telescope.nvim', config = function() require('configs.telescope') end,
			requires = {
				'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'nvim-treesitter/nvim-treesitter',
				'nvim-telescope/telescope-frecency.nvim', 'tami5/sqlite.lua',
				'nvim-telescope/telescope-dap.nvim', 'mfussenegger/nvim-dap',
				'nvim-telescope/telescope-project.nvim', 'nvim-telescope/telescope-file-browser.nvim',
				{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			}
		}
		use {
			'hrsh7th/nvim-cmp', config = function() require('configs.cmp') end,
			requires = {
				'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
			}
		}
		use {
			'neovim/nvim-lspconfig', config = function() require('configs.lspconfig') end,
			requires = { 'jose-elias-alvarez/null-ls.nvim', 'nvim-lua/plenary.nvim' }
		}
		use {
			'nvim-treesitter/nvim-treesitter', config = function() require('configs.treesitter') end
		}
		use {
			'ray-x/go.nvim', config = function() require('configs.go') end,
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
