return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  config = function(_, opts)
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection

    hop.setup(opts)

    -- `s` buat lompat ke depan
    vim.keymap.set("", "s", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true, desc = "Hop forward" })

    -- `S` buat lompat ke belakang
    vim.keymap.set("", "S", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
    end, { remap = true, desc = "Hop backward" })
  end,
}
