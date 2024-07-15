return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = false
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>f', builtin.find_files, {})

  end
}
