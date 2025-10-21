return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Update parsers automatically
    event = { "BufReadPost", "BufNewFile" },  -- Lazy-load on buffer read
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",  -- Optional, for text objects
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- List of languages to install parsers for
        ensure_installed = {
          "c", "cpp", "lua", "python", "javascript", "typescript", "html", "css", "json", "bash",
        },
        sync_install = false,  -- Install parsers asynchronously
        auto_install = true,  -- Automatically install missing parsers when entering buffer
        highlight = {
          enable = true,  -- Enable Treesitter-based highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,  -- Enable Treesitter-based indentation
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end,
  },
}

