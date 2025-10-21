return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules" }, -- keep ignoring big folders
			},
			pickers = {
				find_files = {
					hidden = true, -- 👈 show hidden (dot) files
					no_ignore = true, -- 👈 include files ignored by .gitignore
				},
				live_grep = {
					additional_args = function(_)
						return { "--hidden", "--no-ignore" } -- 👈 include hidden and ignored
					end,
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fh", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { desc = "Find Hidden Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
	end,
}
