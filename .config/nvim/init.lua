-- ~/.config/nvim/init.lua
-- Entry point: plugins must be loaded first so setup() calls below can reference them.
vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

require("plugins")   -- vim.pack.add — installs & loads all plugins
require("options")   -- vim.opt settings
require("keymaps")   -- all keybindings
require("lsp")       -- LSP, diagnostics, Mason
