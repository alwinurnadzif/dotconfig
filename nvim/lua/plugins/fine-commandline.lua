return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    { 'MunifTanjim/nui.nvim' }
  },
  config = function()
    require("fine-cmdline").setup({
      popup = {
        size = {
          width = '40%'
        },
      }
    })
    vim.keymap.set("n", ":", "<CMD>FineCmdline<CR>", { noremap = true })
  end

}
