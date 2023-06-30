require('lazy').setup({
    { 'folke/lazy.nvim' },
    { 'sainnhe/gruvbox-material',            config = function() vim.cmd 'colorscheme gruvbox-material' end },
    { 'phaazon/hop.nvim',                    config = function() require('plugin.hop') end },
    { 'akinsho/toggleterm.nvim',             config = function() require('plugin.toggleterm') end },
    { 'lukas-reineke/indent-blankline.nvim', config = function() require('plugin.indent-blankline') end },
    { 'anuvyklack/pretty-fold.nvim',         config = function() require('plugin.pretty-fold') end },
    { 'lewis6991/gitsigns.nvim',             config = function() require('plugin.gitsigns') end },
    {
        'kyazdani42/nvim-tree.lua',
        config = function() require('plugin.nvim-tree') end,
        dependencies = 'kyazdani42/nvim-web-devicons',
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('plugin.lualine') end,
        dependencies = 'kyazdani42/nvim-web-devicons',
    },
    {
        'nvim-telescope/telescope.nvim',
        config = function() require('plugin.telescope') end,
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-project.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            'nvim-telescope/telescope-frecency.nvim', 'tami5/sqlite.lua',
            'nvim-telescope/telescope-dap.nvim', 'mfussenegger/nvim-dap',
            'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter',
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function() require('plugin.cmp') end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip'
        }
    },
    {
        'neovim/nvim-lspconfig',
        config = function() require('plugin.lspconfig') end,
        dependencies = { 'jose-elias-alvarez/null-ls.nvim', 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugin.treesitter') end,
        build = function() require('nvim-treesitter.install').update() end
    },
    {
        'ray-x/go.nvim',
        config = function() require('plugin.go') end,
        ft = { 'go', 'gomod', 'gosum' },
        dependencies = { 'rcarriga/nvim-dap-ui', 'mfussenegger/nvim-dap' }
    }
})
