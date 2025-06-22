return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup({
				ensure_installed = {
					-- LSPs
					"clangd",
					"bashls",
					"lua_ls",
					"html",
					"cssls",
					"ruff",
					"pylsp",
					"gopls",
					"ts_ls",
					"jsonls",
					"yamlls",
					-- Formatters and linters
					"stylua",
					"prettier",
					"shfmt",
					"gofmt",
					"shellcheck",
					"black",
					"pylint",
					"eslint_d",
					"luacheck",
					"markdownlint",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"clangd",
				"bashls",
				"lua_ls",
				"html",
				"cssls",
				"ruff",
				"pylsp",
				"gopls",
				"ts_ls",
				"jsonls",
				"yamlls",
			},
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- LSP setups
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })

			-- Ruff for diagnostics
			lspconfig.ruff.setup({
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
					client.server_capabilities.definitionProvider = false
				end,
			})

			-- Pylsp for formatting/linting
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				settings = {
					pylsp = {
						plugins = {
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							black = { enabled = true },
							pylint = { enabled = true },
							pyflakes = { enabled = true },
							pycodestyle = { enabled = true },
							ruff = { enabled = false },
						},
					},
				},
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>fm", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Formatters
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.black,
					-- Linters
					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.luacheck,
					null_ls.builtins.diagnostics.markdownlint,
				},
			})
		end,
	},
}
