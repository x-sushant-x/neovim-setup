-- Telescope Keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ========================
-- BASIC KEYMAPS
-- ========================

-- Save & quit
map('n', '<leader>w', ':w<CR>', opts)   -- Save
map('n', '<leader>q', ':q<CR>', opts)   -- Quit
map('n', '<leader>Q', ':qa!<CR>', opts) -- Quit all

-- Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize splits
map('n', '<leader><Left>', ':vertical resize -2<CR>', opts)
map('n', '<leader><Right>', ':vertical resize +2<CR>', opts)
map('n', '<leader><Up>', ':resize +2<CR>', opts)
map('n', '<leader><Down>', ':resize -2<CR>', opts)

-- Buffer navigation
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':bp <BAR> bd #<CR>', opts)

-- Copy/paste
map('v', '<leader>y', '"+y', opts) -- Copy to system clipboard
map('v', '<leader>p', '"+p', opts) -- Paste from system clipboard
map('n', '<leader>y', '"+y', opts) -- Copy line

-- ========================
-- TREESITTER (Text objects, incremental selection)
-- ========================
-- Make sure treesitter textobjects are installed for this
map('n', '<leader>ts', ':TSHighlightCapturesUnderCursor<CR>', opts)
map('n', '<leader>ti', ':TSToggleHighlight<CR>', opts)

-- Incremental selection (requires treesitter config)
map('n', '<leader>vi', ':lua require"nvim-treesitter.incremental_selection".init_selection()<CR>', opts)
map('v', '<leader>vn', ':lua require"nvim-treesitter.incremental_selection".node_incremental()<CR>', opts)
map('v', '<leader>vp', ':lua require"nvim-treesitter.incremental_selection".node_decremental()<CR>', opts)

-- ========================
-- NVIM-TREE (File explorer)
-- ========================
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)   -- Toggle tree
map('n', '<leader>f', ':NvimTreeFindFile<CR>', opts) -- Find current file
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)  -- Refresh tree
map('n', '<leader>n', ':NvimTreeFocus<CR>', opts)    -- Focus tree

-- ========================
-- BUFFERLINE (Tabs)
-- ========================
map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
map('n', '<leader>c', ':bdelete<CR>', opts) -- Close buffer

-- ========================
-- GITSIGNS
-- ========================
map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', opts)
map('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', opts)
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gb', ':Gitsigns blame_line<CR>', opts)
map('n', '<leader>gd', ':Gitsigns diffthis<CR>', opts)

-- ========================
-- VIM-FUGITIVE
-- ========================
map('n', '<leader>gf', ':Git<CR>', opts) -- Open fugitive
map('n', '<leader>gc', ':Git commit<CR>', opts)
map('n', '<leader>gp', ':Git push<CR>', opts)
map('n', '<leader>gl', ':Git pull<CR>', opts)
map('n', '<leader>gb', ':Git blame<CR>', opts)
map('n', '<leader>gs', ':Git status<CR>', opts)

-- ========================
-- LUALINE
-- ========================
-- No keymaps needed for lualine itself, it's a statusline plugin.
-- Optional: toggle statusline visibility
map('n', '<leader>ll', ':LualineToggle<CR>', opts)
