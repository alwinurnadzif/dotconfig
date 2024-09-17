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
        ensure_installed = { "lua_ls", "ts_ls", "vuels", "gopls", "volar", "typos_lsp" }
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

      lspconfig.ts_ls.setup({
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/home/tokio/workspace/apps/node/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      })
      local util = require 'lspconfig.util'
      local function get_typescript_server_path(root_dir)
        local global_ts = '/home/tokio/workspace/apps/node/lib/node_modules/typescript/lib'
        -- Alternative location if installed as root:
        -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
        local found_ts = ''
        local function check_dir(path)
          found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
          if util.path.exists(found_ts) then
            return path
          end
        end
        if util.search_ancestors(root_dir, check_dir) then
          return found_ts
        else
          return global_ts
        end
      end

      require 'lspconfig'.volar.setup {
        capabilities = capabilities,
        on_new_config = function(new_config, new_root_dir)
          new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end,
      }

      lspconfig.emmet_ls.setup({
        filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact" },
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
        init_options = {
          diagnosticSeverity = "Info"
        }
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
