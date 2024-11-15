return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true, -- disables setting the background color.
        custom_highlights = function(colors)
          return {
            CursorLine = { bg = colors.surface1 }
          }
        end
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
