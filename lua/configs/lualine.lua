require('lualine').setup({
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename', path = 3}},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_a = {
			{
				'buffers', mode = 2,
				filetype_names = {
					['neo-tree'] = 'NeoTree',
					TelescopePrompt = 'Telescope',
					packer = 'Packer',
					fzf = 'FZF',
				}
			},
		}
	},
	extensions = {'neo-tree', 'nvim-dap-ui', 'quickfix', 'toggleterm'},
})
