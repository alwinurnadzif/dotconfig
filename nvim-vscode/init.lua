require("plugins")
if vim.g.vscode then
    -- Leader key
    vim.g.mapleader = " "

    local o = vim.opt
    o.clipboard = "unnamedplus"

    local key = vim.keymap.set
    local opts = { noremap = true, silent = true }

    key("n", "<leader>e", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>", opts)
end
