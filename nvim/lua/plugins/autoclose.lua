return {
  "m4xshen/autoclose.nvim",
  cond = not vim.g.vscode,
  config = function()
    require("autoclose").setup({})
  end

}
