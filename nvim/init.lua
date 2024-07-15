if vim.g.vscode then
  return require("config.vscode")
end

vim.g.mapleader = " "

require("config.settings")
require("config.lazy")
require("config.keymaps")
