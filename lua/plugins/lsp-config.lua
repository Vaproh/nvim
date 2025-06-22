return {
	-- Mason setup
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

	-- Mason LSP config
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

	-- LSP setup
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Show diagnostics inline (virtual text)
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Autoformat on save
			local on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end

			-- Core LSPs
			lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.cssls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.yamlls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
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

			-- ✅ Pylsp with black + ruff (no extra ruff LSP)
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					pylsp = {
						plugins = {
							black = { enabled = true },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							pylint = { enabled = false },
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							ruff = { enabled = true },
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

	-- null-ls for formatters and non-LSP linters
	{
		"nvimtools/none-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.luacheck,
					null_ls.builtins.diagnostics.markdownlint,
				},
			})
		end,
	},
}
