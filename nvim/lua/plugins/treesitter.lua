return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter")

      configs.setup({
        enable = true,
        ensure_installed = { "lua", "vim", "vimdoc", "vue", "go", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,             -- Automatically jump forward to text object
            keymaps = {
              ["af"] = "@function.outer", -- Select the whole function
              ["if"] = "@function.inner", -- Select inside the function
            },
          },
        }
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enable = true
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
