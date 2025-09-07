local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>e", ":Neotree toggle<CR>")
keymap("i", "jj", "<Esc>")

-- keymap("n", "L", "$", opts)
-- keymap("n", "H", "^", opts)
--
-- keymap("v", "L", "$", opts)
-- keymap("v", "H", "^", opts)

keymap("n", "[b", ":bprev<CR>")
keymap("n", "]b", ":bnext<CR>")

vim.api.nvim_set_keymap("n", "<M-W>", "<C-W>", { noremap = true, silent = true })

keymap("n", "<leader>t", "`")

keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

keymap("n", "t", "`", opts)

keymap("i", "<c-l>", "<cmd> lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)

keymap("i", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
