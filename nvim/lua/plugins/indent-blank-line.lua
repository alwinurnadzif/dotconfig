return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ibl = require("ibl").setup({
      scope = {
        enabled = true
      }
    })
  end
}
