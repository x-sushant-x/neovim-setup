-- Make background transparent (for line numbers, sign column, etc.)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })


-- Enable absolute and relative line numbers
vim.opt.number = true         -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- Appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.numberwidth = 4

-- Smooth mouse scrolling
vim.opt.mouse = "a" -- enable mouse in all modes
vim.opt.scroll = 3  -- move 3 lines per scroll tick

vim.opt.clipboard = "unnamedplus"


-- Spaces for tabs
vim.opt.expandtab = true -- Converts tabs to spaces
vim.opt.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4   -- Number of spaces for autoindent
vim.opt.softtabstop = 4  -- Number of spaces for manual <Tab>
