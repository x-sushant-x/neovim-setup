-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    keys = {
        -- Toggle nvim-tree with Ctrl+n
        { "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle Nvim Tree" },
    },
    opts = {
        sort = {
            sorter = "case_sensitive",
        },
        view = {
            width = 40,
            side = "right", -- open nvim-tree on the right side
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
        },
        hijack_cursor = false,
        update_focused_file = {
            enable = true,
            update_cwd = true,
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)

        -- Make background transparent
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
    end,
}
