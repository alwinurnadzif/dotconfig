return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup({
      defaults = {
        preview = false
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {         -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              -- freeze the current list and start a fuzzy search in the frozen list
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        }
      }
    })

    telescope.load_extension("live_grep_args")

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set("n", "<leader>fs", require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
  end
}
