return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true, -- simple setup
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "gopls" },
		},
	},
	{
		"hrsh7th/nvim-cmp", -- Completion engine
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig", -- optional, for Mason compatibility
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Base capabilities for nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Common on_attach: set keymaps when LSP starts
			local on_attach = function(_, bufnr)
				local map = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
				end
				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "gr", vim.lsp.buf.references, "Find references")
				map("n", "K", vim.lsp.buf.hover, "Hover documentation")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "Format file")
			end

			-- List of servers to configure natively
			local servers = {
				lua_ls = {
					cmd = { "lua-language-server" },
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},
				pyright = { cmd = { "pyright-langserver", "--stdio" } },
				ts_ls = { cmd = { "typescript-language-server", "--stdio" } },
				html = { cmd = { "vscode-html-language-server", "--stdio" } },
				cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
			}

			-- Configure and start servers
			for name, opts in pairs(servers) do
				opts.on_attach = on_attach
				opts.capabilities = capabilities
				vim.lsp.config[name] = opts
				vim.lsp.start(vim.lsp.config[name])
			end

			-- Auto-format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end,
	},
}
