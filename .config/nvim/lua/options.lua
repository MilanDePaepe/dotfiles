-- ~/.config/nvim/lua/options.lua
-- Mirrors LazyVim's default options (lazyvim.config.options)

local opt = vim.opt

-- ── Appearance ────────────────────────────────────────────────────────────────
opt.termguicolors  = true          -- 24-bit colour
opt.number         = true          -- absolute line numbers
opt.relativenumber = true          -- relative line numbers
opt.signcolumn     = "yes"         -- always show sign column (no layout shift)
opt.cursorline     = true          -- highlight current line
opt.colorcolumn    = ""            -- no colour column by default
opt.showmode       = false         -- mode shown by lualine instead
opt.laststatus     = 3             -- single global statusline
opt.cmdheight      = 0             -- hide cmdline when not in use (Noice handles it)
opt.pumblend       = 10            -- pseudo-transparency for popup menu
opt.winblend       = 10            -- pseudo-transparency for floating windows
opt.conceallevel   = 2             -- hide markup in markdown etc.

-- ── Indentation ───────────────────────────────────────────────────────────────
opt.expandtab      = true          -- spaces, not tabs
opt.shiftwidth     = 2
opt.tabstop        = 2
opt.softtabstop    = 2
opt.shiftround     = true          -- round indent to multiple of shiftwidth
opt.smartindent    = true

-- ── Search ────────────────────────────────────────────────────────────────────
opt.hlsearch       = true
opt.incsearch      = true
opt.ignorecase     = true
opt.smartcase      = true          -- case-sensitive when uppercase present

-- ── Splits & windows ─────────────────────────────────────────────────────────
opt.splitbelow     = true          -- horizontal splits go below
opt.splitright     = true          -- vertical splits go right
opt.splitkeep      = "screen"      -- keep text on-screen when splitting

-- ── Files & undo ─────────────────────────────────────────────────────────────
opt.autowrite      = true          -- save before :make, :next, etc.
opt.undofile       = true          -- persistent undo
opt.undolevels     = 10000
opt.backup         = false
opt.swapfile       = false
opt.confirm        = true          -- ask instead of failing on unsaved changes

-- ── Editing feel ─────────────────────────────────────────────────────────────
opt.mouse          = "a"           -- enable mouse in all modes
opt.clipboard      = "unnamedplus" -- sync with system clipboard
opt.scrolloff      = 4             -- keep 4 lines above/below cursor
opt.sidescrolloff  = 8
opt.wrap           = false
opt.linebreak      = true          -- break at word boundaries (if wrap is on)
opt.breakindent    = true
opt.virtualedit    = "block"       -- allow cursor past end in block mode
opt.jumpoptions    = "view"        -- restore view when jumping

-- ── Completion ────────────────────────────────────────────────────────────────
opt.completeopt    = "menu,menuone,noselect"
opt.wildmode       = "longest:full,full"

-- ── Performance ───────────────────────────────────────────────────────────────
opt.updatetime     = 200           -- faster CursorHold / gitsigns refresh
opt.timeoutlen     = 300           -- faster which-key popup

-- ── Folds (Neovim 0.10+ native folds via LSP/treesitter) ─────────────────────
opt.foldlevel      = 99            -- open all folds by default
opt.foldmethod     = "expr"
opt.foldexpr       = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- ↑ If you're not using LazyVim's util, replace with:
-- opt.foldexpr    = "nvim_treesitter#foldexpr()"

-- ── Misc ──────────────────────────────────────────────────────────────────────
opt.formatoptions  = "jcroqlnt"    -- sane paragraph re-flowing
opt.grepformat     = "%f:%l:%c:%m"
opt.grepprg        = "rg --vimgrep"
opt.inccommand     = "nosplit"     -- live preview of :s substitutions
opt.smoothscroll   = true          -- Neovim 0.10+

-- Spell (off by default, toggled with <leader>us)
opt.spell          = false
opt.spelllang      = { "en" }

-- -- ── Filetype / encoding ───────────────────────────────────────────────────────
-- vim.g.mapleader      = " "
-- vim.g.maplocalleader = "\\"

-- Disable some built-in plugins LazyVim also disables
vim.g.loaded_netrw            = 1   -- use snacks / neo-tree instead
vim.g.loaded_netrwPlugin      = 1
