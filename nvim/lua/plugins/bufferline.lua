return {
	"akinsho/bufferline.nvim",
	cond = not vim.g.vscode,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local cattpuccin = require("catppuccin.palettes").get_palette("latte")
		local red = cattpuccin.base
		local white = cattpuccin.blue
		require("bufferline").setup({

			highlights = {

				buffer_selected = { fg = white, bg = red, bold = true },
				tab_selected = { fg = white, bg = red, bold = true },
				-- paksa override semua state selected
				error_selected = { fg = white, bg = red, bold = true },
				warning_selected = { fg = white, bg = red, bold = true },
				info_selected = { fg = white, bg = red, bold = true },
				hint_selected = { fg = white, bg = red, bold = true },
				modified_selected = { fg = white, bg = red, bold = true },
			},
			options = {
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
