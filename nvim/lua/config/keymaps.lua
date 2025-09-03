vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "H", "^")

vim.keymap.set("n", "[b", ":bprev<CR>")
vim.keymap.set("n", "]b", ":bnext<CR>")

vim.api.nvim_set_keymap("n", "<M-W>", "<C-W>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t", "`")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.keymap.set("n", "t", "`", { noremap = true, silent = true })

-- vim.keymap.set("v", "Y", '"+y')
-- vim.keymap.set("n", "Y", '"+y')
--
-- vim.keymap.set("v", "P", '"+p')
-- vim.keymap.set("n", "P", '"+p')
--
-- vim.keymap.set("v", "y", '"+y')
-- vim.keymap.set("n", "y", '"+y')
