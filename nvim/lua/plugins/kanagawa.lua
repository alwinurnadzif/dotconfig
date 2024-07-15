return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      theme = "wave",
      transparent = false
    })

    -- vim.cmd("colorscheme kanagawa")
  end
}
