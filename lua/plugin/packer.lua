require('packer').startup({
    function(use)
        use {
            'wbthomason/packer.nvim'
        }
        use {
            'sainnhe/gruvbox-material', config = function() require('plugin.gruvbox') end
        }
        use {
            'phaazon/hop.nvim', config = function() require('plugin.hop') end
        }
        use {
            'kyazdani42/nvim-tree.lua', config = function() require('plugin.nvim-tree') end,
            requires = 'kyazdani42/nvim-web-devicons',
        }
        use {
            'nvim-lualine/lualine.nvim', config = function() require('plugin.lualine') end,
            requires = 'kyazdani42/nvim-web-devicons',
        }
        use {
            'akinsho/toggleterm.nvim', config = function() require('plugin.toggleterm') end
        }
        use {
            'lukas-reineke/indent-blankline.nvim', config = function() require('plugin.indent-blankline') end
        }
        use {
            'anuvyklack/pretty-fold.nvim', config = function() require('plugin.pretty-fold') end
        }
        use {
            'lewis6991/gitsigns.nvim', config = function() require('plugin.gitsigns') end
        }
        use {
            'nvim-telescope/telescope.nvim', config = function() require('plugin.telescope') end,
            requires = {
                'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'nvim-treesitter/nvim-treesitter',
                'nvim-telescope/telescope-project.nvim', 'nvim-telescope/telescope-file-browser.nvim',
                'nvim-telescope/telescope-live-grep-args.nvim',
                'nvim-telescope/telescope-frecency.nvim', 'tami5/sqlite.lua',
                'nvim-telescope/telescope-dap.nvim', 'mfussenegger/nvim-dap',
                { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            }
        }
        use {
            'hrsh7th/nvim-cmp', config = function() require('plugin.cmp') end,
            requires = {
                'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
            }
        }
        use {
            'neovim/nvim-lspconfig', config = function() require('plugin.lspconfig') end,
            requires = { 'jose-elias-alvarez/null-ls.nvim', 'nvim-lua/plenary.nvim' }
        }
        use {
            'nvim-treesitter/nvim-treesitter', config = function() require('plugin.treesitter') end
        }
        use {
            'ray-x/go.nvim', config = function() require('plugin.go') end,
            requires = { 'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap' }
        }
    end,
    config = {
        max_jobs = 8, compile_on_sync = true,
        compile_path = require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
    }
})
