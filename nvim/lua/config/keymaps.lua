local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- neo tree
keymap("n", "<leader>e", ":Neotree toggle<CR>")

-- buffer
keymap("n", "[b", ":bprev<CR>")
keymap("n", "]b", ":bnext<CR>")

-- alias
keymap("n", "t", "`", opts)
keymap("i", "jj", "<Esc>")
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
vim.api.nvim_set_keymap("n", "<M-W>", "<C-W>", opts)

-- lua snip
keymap("i", "<c-l>", "<cmd> lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<C-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
