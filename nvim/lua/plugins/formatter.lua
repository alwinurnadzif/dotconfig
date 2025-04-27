return {

  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        html = { "prettier" },
        vue = { "prettier" },
        php = { "easy-coding-standard" },
        markdown = { "prettier" },
        --        json = { "prettier" }
        go = { 'gofmt' },
        xml = { 'xmlformatter' },
        javascriptreact = { "prettier" }
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000
      }
    })



    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000
      })
    end)
  end


}
