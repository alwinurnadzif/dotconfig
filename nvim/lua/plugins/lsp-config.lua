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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Alternatif handler diagnostic yang kompatibel dengan Neovim 0.11+
			local default_publish_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]
			vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
				if result and result.diagnostics then
					local client = vim.lsp.get_client_by_id(ctx.client_id)
					if client and client.name == "typos_lsp" then
						for _, d in ipairs(result.diagnostics) do
							-- Paksa semua diagnostic dari typos_lsp jadi warning
							d.severity = vim.diagnostic.severity.WARN
						end
					end
				end
				return default_publish_handler(err, result, ctx, config)
			end

			-- 1. LUA
			vim.lsp.config("lua_ls", { capabilities = capabilities })
			vim.lsp.enable("lua_ls")

			-- 2. GOLANG
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				cmd = { "gopls" },
				on_attach = function()
					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = { "*.go" },
						callback = function(ev)
							-- Automatically format and organize imports
							vim.lsp.buf.format({ async = false, bufnr = ev.buf })
							vim.lsp.buf.code_action({
								context = { only = { "source.organizeImports" } },
								apply = true,
							})
						end,
					})
				end,
				settings = {
					gopls = {
						analyses = { unusedparams = true },
						staticcheck = true,
						gofumpt = true,
					},
				},
			})
			vim.lsp.enable("gopls")

			-- 3. PYTHON (Menambahkan Pyright)
			vim.lsp.config("pyright", {
				capabilities = capabilities,
				filetypes = { "python" },
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			})
			vim.lsp.enable("pyright")

			-- 4. EMMET
			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
				filetypes = {
					"astro", "css", "eruby", "html", "htmldjango",
					"javascriptreact", "less", "pug", "sass", "scss",
					"svelte", "typescriptreact", "vue",
				},
			})
			vim.lsp.enable("emmet_ls")

			-- 5. CSS
			vim.lsp.config("cssls", { capabilities = capabilities })
			vim.lsp.enable("cssls")

			-- 6. TYPOS
			vim.lsp.config("typos_lsp", {
				capabilities = capabilities,
				cmd_env = { RUST_LOG = "error" },
				init_options = { diagnosticSeverity = 2 },
			})
			vim.lsp.enable("typos_lsp")

			-- 7. LEMMINX (XML)
			vim.lsp.config("lemminx", { capabilities = capabilities })
			vim.lsp.enable("lemminx")

			-- Keymaps (Tetap aman digunakan)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gk", vim.lsp.buf.signature_help)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}

