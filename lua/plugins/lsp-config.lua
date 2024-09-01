return {
	{
	  "williamboman/mason.nvim",
	  cmd = "Mason",
	  config = function()
		require("mason").setup()
	  end,
	},
	{
	  "williamboman/mason-lspconfig.nvim",
	  event = "VeryLazy",
	  opts = {
		ensure_installed = { "clangd", "bashls", "lua_ls", "html", "cssls", "ruff", "pylsp", "gopls" },
		auto_install = true,
	  },
	},
	{
	  "neovim/nvim-lspconfig",
	  event = { "BufReadPre", "BufNewFile" },
	  config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
  
		local lspconfig = require("lspconfig")
		lspconfig.bashls.setup({
		  capabilities = capabilities,
		})
		lspconfig.pylsp.setup({
		  capabilities = capabilities,
		})
        lspconfig.ruff.setup({
          capabilities = capabilities,
        })
        lspconfig.html.setup({
		  capabilities = capabilities,
		})
		lspconfig.cssls.setup({
		  capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({
		  capabilities = capabilities,
		})
		lspconfig.clangd.setup({
		  capabilities = capabilities,
		})
        lspconfig.gopls.setup({
          capabilities = capabilities,
          cmd = {"gopls"},
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          settings = {
            completeUnimported = true,
            usePlaceholders = true,
            analysis = {
              unusedparams = true
              }
          }
        })
  
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	  end,
	},
  }
