vim.o.number = true
vim.o.relativenumber = true

require("plugins")

-- pastikan detect kalau lagi di vscode
if vim.g.vscode then
	vim.o.timeoutlen = 300 -- default 1000 ms, bisa dipercepat
	vim.keymap.set("i", "L", "<Esc>", { noremap = true, silent = true })
	-- Leader key
	vim.g.mapleader = " "

	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }

	-- NORMAL MODE MAPPINGS
	-- Panel

	keymap("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", opts)

	-- Movement
	keymap("n", "H", "^", opts)
	keymap("n", "L", "$", opts)

	-- Buffer navigation
	keymap("n", "[b", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>", opts)
	keymap("n", "]b", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", opts)

	-- LSP
	keymap("n", "K", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>", opts)
	keymap("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", opts)
	keymap("n", "gD", "<Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>", opts)
	keymap("n", "gk", "<Cmd>call VSCodeNotify('editor.action.triggerParameterHints')<CR>", opts)

	keymap("n", "[d", "<Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>", opts)
	keymap("n", "]d", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>", opts)

	keymap("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>", opts)
	keymap("n", "<leader>ca", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", opts)

	-- Finder
	keymap("n", "<leader>ff", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", opts)
	keymap("n", "<leader>fs", "<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>", opts)
	keymap("n", "<leader>fb", "<Cmd>call VSCodeNotify('actions.find')<CR>", opts)

	-- VISUAL MODE MAPPINGS
	keymap("v", "H", "^", opts)
	keymap("v", "L", "$", opts)

	-- terminal
	keymap("n", "<C-j>", function()
		vim.fn.VSCodeNotify("workbench.action.terminal.toggleTerminal")
	end, opts)

	vim.opt.clipboard = "unnamedplus"

	-- Map 'jj' to escape in insert mode
end
