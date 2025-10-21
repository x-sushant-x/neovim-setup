return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup {
				size = 20,
				open_mapping = [[<C-\>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float", -- floating terminal like VS Code
				float_opts = {
					border = "curved", -- nice rounded borders
					winblend = 0, -- transparency (0 = opaque)
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			}

			-- Terminal keymaps for VS Code-like behavior
			function _G.set_terminal_keymaps()
				local opts = { noremap = true, silent = true }
				-- exit terminal mode
				vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', [[<C-\><C-n>]], opts)
				-- movement between splits
				vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
				vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
				-- toggle terminal in normal mode
				vim.api.nvim_buf_set_keymap(0, 'n', '<leader>t', '<cmd>ToggleTerm<CR>', opts)
			end

			-- automatically apply keymaps to every terminal
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end,
		keys = {
			{ "<C-\\>",    "<cmd>ToggleTerm<CR>", desc = "Toggle floating terminal" },
			{ "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Toggle floating terminal" },
		},
	},
}
