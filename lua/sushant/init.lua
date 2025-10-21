require("sushant.keymaps")
require("sushant.custom_settings")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
