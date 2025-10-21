return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup {
			options = {
				numbers = "none",
				close_command = "bdelete! %d", -- how to close a buffer
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d", -- go to buffer
				middle_mouse_command = nil,
				indicator = { style = 'icon', icon = '▎' }, -- VS Code style
				buffer_close_icon = '',
				modified_icon = '●',
				close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				max_name_length = 30,
				max_prefix_length = 15,
				tab_size = 21,
				diagnostics = "nvim_lsp", -- show LSP diagnostics
				offsets = { { filetype = "NvimTree", text = "Explorer", text_align = "left" } },
				show_buffer_icons = true, -- filetype icons
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "thin", -- can also use 'slant'
				enforce_regular_tabs = false,
			}
		}
	end
}
