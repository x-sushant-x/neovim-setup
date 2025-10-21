return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        compile = false,                   -- enable compiling the colorscheme
        undercurl = true,                  -- enable undercurls
        commentStyle = { italic = false }, -- disable italics for comments
        functionStyle = {},
        keywordStyle = { italic = false }, -- disable italics for keywords
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,    -- do not set background color
        dimInactive = false,   -- dim inactive window
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors)
            return {}
        end,
        theme = "wave",
        background = {
            dark = "wave",
            light = "lotus",
        },
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd("colorscheme kanagawa")
    end,
}
