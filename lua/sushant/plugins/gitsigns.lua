return {
	"lewis6991/gitsigns.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("gitsigns").setup {
			signs = {
				add          = { hl = "GitGutterAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change       = { hl = "GitGutterChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
				delete       = { hl = "GitGutterDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				topdelete    = { hl = "GitGutterDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
				changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			},
			numhl = true, -- highlight line numbers
			linehl = false, -- highlight full lines
			watch_gitdir = { interval = 1000, follow_files = true },
			current_line_blame = true, -- show blame info for current line
			signcolumn = true, -- show signs in gutter
		}
	end
}
