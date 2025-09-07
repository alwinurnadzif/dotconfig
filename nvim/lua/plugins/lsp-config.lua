return {

	{
		"williamboman/mason.nvim",
		cond = not vim.g.vscode,
		config = function()
			require("mason").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",

		cond = not vim.g.vscode,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
				if result and result.diagnostics then
					for _, d in ipairs(result.diagnostics) do
						local client = vim.lsp.get_client_by_id(ctx.client_id)
						if client and client.name == "typos_lsp" then
							-- Paksa semua diagnostic dari typos_lsp jadi warning
							d.severity = vim.diagnostic.severity.WARN
						end
					end
				end
				return vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
			end

			-- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- golang
			lspconfig.gopls.setup({
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				cmd = { "gopls" },
				on_attach = function()
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							-- Automatically format and organize imports
							vim.lsp.buf.format({ async = false })
							vim.lsp.buf.code_action({
								context = { only = { "source.organizeImports" } },
								apply = true,
							})
						end,
					})
				end,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function()
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							-- Automatically format and organize imports
							vim.lsp.buf.format({ async = false })
							vim.lsp.buf.code_action({
								context = { only = { "source.organizeImports" } },
								apply = true,
							})
						end,
					})
				end,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			local node_modules = "/home/tokio/workspace/apps/node/lib/node_modules/"

			-- typescript
			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = node_modules .. "@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
					"javascriptreact",
				},
			})

			-- vue
			lspconfig.volar.setup({
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
				init_options = {
					typescript = {
						tsdk = node_modules .. "typescript/lib/",
					},
					scriptSetup = true, -- Menyediakan dukungan penuh untuk <script setup>
				},
				capabilities = capabilities,
			})

			-- emmet
			lspconfig.emmet_ls.setup({
				filetypes = {
					"astro",
					"css",
					"eruby",
					"html",
					"htmldjango",
					"javascriptreact",
					"less",
					"pug",
					"sass",
					"scss",
					"svelte",
					"typescriptreact",
					"vue",
				},
				capabilities = capabilities,
			})

			-- css
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			-- php
			lspconfig.intelephense.setup({
				filetypes = { "php" },
				capabilities = capabilities,
			})

			-- dart
			lspconfig.dartls.setup({
				capabilities = capabilities,
			})

			-- typo
			lspconfig.typos_lsp.setup({
				cmd_env = { RUST_LOG = "error" },
				capabilities = capabilities,
				init_options = {
					diagnosticSeverity = 2,
				},
			})

			-- lemminx
			lspconfig.lemminx.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gk", vim.lsp.buf.signature_help)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set(
				"n",
				"<leader>ca",
				"<cmd>lua vim.lsp.buf.code_action()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
