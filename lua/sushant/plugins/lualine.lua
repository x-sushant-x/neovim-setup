return {
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = true,
				theme = 'auto', -- automatically adapts to your colorscheme
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {},
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { 'mode' },               -- shows current mode
				lualine_b = { 'branch', 'diff' },     -- git branch and diff stats
				lualine_c = { { 'filename', file_status = true, path = 1 } }, -- show full path
				lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- file info
				lualine_y = { 'progress' },           -- progress in file
				lualine_z = { 'location' }            -- cursor location
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { 'filename', path = 1 } },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			extensions = { 'nvim-tree' }
		},
		dependencies = { 'nvim-tree/nvim-web-devicons' }, -- lualine requires icons
	}
}
