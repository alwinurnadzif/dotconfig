return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			version = "^1.0.0",
		},
	},
	config = function()
		local telescope = require("telescope")
		local lga_actions = require("telescope-live-grep-args.actions")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				preview = true,
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				disabled_devicons = true,
				color_devicons = false,
				preview = {
					hide_on_startup = true, -- telescope 0.1.8+
				},
				file_ignore_patterns = { "node_modules", "%.git", "dist" },
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							-- ["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			},
		})

		telescope.load_extension("live_grep_args")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set(
			"n",
			"<leader>fs",
			require("telescope").extensions.live_grep_args.live_grep_args,
			{ noremap = true }
		)
		vim.keymap.set("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
	end,
}
