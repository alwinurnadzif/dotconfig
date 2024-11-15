return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local cattpuccin = require('catppuccin.palettes').get_palette()
    require("bufferline").setup({
      highlights = {
        buffer_selected = {
          fg = cattpuccin.text,
          bg = cattpuccin.base
        },

      },
      options = {
        diagnostics = "nvim_lsp",
      }
    })
  end,

}
