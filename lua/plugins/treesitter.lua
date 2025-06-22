return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "c",
          "cpp",
          "go",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "yaml",
          "markdown",
          "markdown_inline",
          "toml",
          "regex",
          "rust",
          "java",
          "php",
          "query",
          "dockerfile",
          "gitignore",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
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
  }
}

