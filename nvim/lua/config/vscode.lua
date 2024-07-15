local g = vim.g
local o = vim.o
local map = vim.keymap.set
local notify = vim.fn.VSCodeNotify

local function action(cmd)
    return function()
        return notify(cmd)
    end
end

g.mapleader = " "
o.clipboard = "unnamedplus"
o.backup = false
o.writebackup = false
o.swapfile = false
o.ignorecase = true
o.relativenumber = true

-- movement
map("n", "L", "$")
map("n", "H", "^")
map("v", "L", "$")
map("v", "H", "^")
-- tab
map('n', '[b', action('workbench.action.previousEditor'))
map('n', ']b', action('workbench.action.nextEditor'))
-- comment line
map("n", "gcc", action("editor.action.commentLine"))
-- editor
map("n", "<leader>f", action("workbench.action.quickOpen"))


vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
    end,
})
