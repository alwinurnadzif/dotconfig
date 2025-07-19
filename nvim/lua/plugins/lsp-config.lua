return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end

  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "vuels", "gopls", "typos_lsp", "emmet_ls", "intelephense", "cssls" }
      })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "prettier" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities
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
                apply = true
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
            gofumpt = true
          },
        },
      })

      local node_modules = "/home/tokio/workspace/apps/node/lib/node_modules/"

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
          "javascriptreact"
        },
      })

      lspconfig.volar.setup({
        filetypes = {
          "javascript",
          "typescript",
          "vue"
        },
        init_options = {
          typescript = {
            tsdk = node_modules .. "typescript/lib/"
          },

          scriptSetup = true -- Menyediakan dukungan penuh untuk <script setup>
        },
        capabilities = capabilities

      })

      lspconfig.emmet_ls.setup({
        filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue" },
        capabilities = capabilities
      })

      lspconfig.cssls.setup({
        capabilities = capabilities
      })

      lspconfig.intelephense.setup({
        filetypes = { "php" },
        capabilities = capabilities
      })

      lspconfig.dartls.setup({
        capabilities = capabilities
      })

      lspconfig.typos_lsp.setup({
        cmd_env = { RUST_LOG = "error" },
        capabilities = capabilities,
        init_options = {
          diagnosticSeverity = "Warn"
        }
      })

      lspconfig.lemminx.setup({
        capabilities = capabilities
      })


      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gk", vim.lsp.buf.signature_help)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
    end
  }
}
