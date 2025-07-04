return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      buffers = {
        follow_current_file = {
          enabled = true
        }
      },
      default_component_configs = {
        icon = {
          folder_closed = "+",
          folder_open = "-",
          folder_empty = " ",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
      },

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
            ".vscode"
          }
        },
        renderers = {
          directory = {
            { "indent" },
            { "icon" },
            { "name" },
          },
          file = {
            { "indent" },
            { "name" },
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      }
    })
  end
}
