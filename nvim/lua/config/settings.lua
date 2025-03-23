vim.o.termguicolors = true
vim.o.number = true
vim.o.signcolumn = 'yes:1'
vim.o.clipboard = "unnamedplus"
vim.o.wrap = false
vim.o.cursorline = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.scrolloff = 10

-- Highlight on yank
vim.api.nvim_create_augroup('YankHighlight', { clear = true })

-- Function to highlight yanked text
local function highlight_yank()
  vim.api.nvim_set_hl(0, 'YankHighlight', { bg = '#61AFEF', fg = '#000000', bold = true }) -- Customize highlight group here
  vim.cmd('highlight YankHighlight guifg=#000000 guibg=#61AFEF gui=bold')                  -- Customize highlight group here
end

-- Autocmd to highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    highlight_yank()
    vim.highlight.on_yank({ higroup = 'YankHighlight', timeout = 100 }) -- Highlight duration in milliseconds
  end,
})
