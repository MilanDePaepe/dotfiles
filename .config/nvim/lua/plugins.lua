-- ~/.config/nvim/lua/plugins.lua
-- Mirrors every plugin that LazyVim enables by default, translated to vim.pack.
-- After vim.pack.add() returns, the plugins are on the runtimepath and can be
-- require()'d immediately — no lazy-loading, no callbacks.

vim.pack.add({
  -- ──────────────────────────────────────────────
  -- COLORSCHEME
  -- ──────────────────────────────────────────────
  { src = "https://github.com/folke/tokyonight.nvim",              name = "tokyonight" },
  { src = "https://github.com/catppuccin/nvim",                    name = "catppuccin" },
  { src = "https://github.com/rebelot/kanagawa.nvim",              name = "kanagawa" },
  { src = "https://github.com/rose-pine/neovim",                   name = "rose-pine" },
  { src = "https://github.com/metalelf0/black-metal-theme-neovim", name = "black-metal" },
  { src = "https://github.com/ficd0/ashen.nvim",                   name = "ashen" },
  -- ──────────────────────────────────────────────
  -- CODING
  -- ──────────────────────────────────────────────
  -- Completion
  {
    src = "https://github.com/Saghen/blink.cmp",
    name = "blink-cmp",
    version = "v1.10.1",
  },

  -- Auto pairs (mini.pairs)
  { src = "https://github.com/echasnovski/mini.pairs",                    name = "mini.pairs" },

  -- Better text-objects (mini.ai) — a/i motions for functions, classes, etc.
  { src = "https://github.com/echasnovski/mini.ai",                       name = "mini.ai" },

  -- Multi-language comment syntax (ts-comments.nvim)
  { src = "https://github.com/folke/ts-comments.nvim",                    name = "ts-comments" },

  -- Lua dev completion / type checking for your own config (lazydev.nvim)
  { src = "https://github.com/folke/lazydev.nvim",                        name = "lazydev" },

  -- ──────────────────────────────────────────────
  -- EDITOR
  -- ──────────────────────────────────────────────

  -- Multi-file search & replace UI
  { src = "https://github.com/MagicDuck/grug-far.nvim",                   name = "grug-far" },

  -- Flash — label-based jump/search
  { src = "https://github.com/folke/flash.nvim",                          name = "flash" },

  -- Keymap popup
  { src = "https://github.com/folke/which-key.nvim",                      name = "which-key" },

  -- Git hunk signs + stage/blame/diff helpers
  { src = "https://github.com/lewis6991/gitsigns.nvim",                   name = "gitsigns" },

  -- Snacks — LazyVim's swiss-army knife (dashboard, notifier, picker, terminal, …)
  { src = "https://github.com/folke/snacks.nvim",                         name = "snacks" },

  -- Trouble — quickfix / diagnostics list
  { src = "https://github.com/folke/trouble.nvim",                        name = "trouble" },

  -- Todo-comments — highlight TODO/FIXME/HACK etc.
  { src = "https://github.com/folke/todo-comments.nvim",                  name = "todo-comments" },

  -- File explorer
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim",               name = "neo-tree" },

  -- ──────────────────────────────────────────────
  -- FORMATTING
  -- ──────────────────────────────────────────────
  { src = "https://github.com/stevearc/conform.nvim",                     name = "conform" },

  -- ──────────────────────────────────────────────
  -- LINTING
  -- ──────────────────────────────────────────────
  { src = "https://github.com/mfussenegger/nvim-lint",                    name = "nvim-lint" },

  -- ──────────────────────────────────────────────
  -- LSP
  -- ──────────────────────────────────────────────
  { src = "https://github.com/neovim/nvim-lspconfig",                     name = "nvim-lspconfig" },

  -- Mason — install language servers, linters, formatters
  { src = "https://github.com/williamboman/mason.nvim",                   name = "mason" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim",         name = "mason-lspconfig" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", name = "mason-tool-installer" },

  -- None-ls / null-ls successor for injecting sources
  -- (LazyVim uses this internally for some formatting/linting sources)
  -- Uncomment if you need it:
  -- { src = "https://github.com/nvimtools/none-ls.nvim", name = "none-ls" },

  -- ──────────────────────────────────────────────
  -- TREESITTER
  -- ──────────────────────────────────────────────
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    version = "main",
  },

  -- ──────────────────────────────────────────────
  -- UI
  -- ──────────────────────────────────────────────

  -- Statusline
  { src = "https://github.com/nvim-lualine/lualine.nvim",           name = "lualine" },

  -- Indent guides
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "indent-blankline" },

  -- Nui (UI component library — required by Noice & others)
  { src = "https://github.com/MunifTanjim/nui.nvim",                name = "nui" },

  -- Noice — replaces cmdline / messages / popup UI
  { src = "https://github.com/folke/noice.nvim",                    name = "noice" },

  -- Notify — styled notification windows (used by Noice and others)
  { src = "https://github.com/rcarriga/nvim-notify",                name = "nvim-notify" },

  -- Icons (required by many plugins)
  { src = "https://github.com/nvim-tree/nvim-web-devicons",         name = "nvim-web-devicons" },
  { src = "https://github.com/echasnovski/mini.icons",              name = "mini.icons" },

  -- Dashboard (Snacks.dashboard handles this — already included above via snacks.nvim)

  -- ──────────────────────────────────────────────
  -- UTIL
  -- ──────────────────────────────────────────────

  -- Session management
  { src = "https://github.com/folke/persistence.nvim",              name = "persistence" },

  -- Plenary (utility library required by many plugins)
  { src = "https://github.com/nvim-lua/plenary.nvim",               name = "plenary" },

  -- Flutter
  { src = "https://github.com/akinsho/flutter-tools.nvim",          name = "flutter-tools" },
  { src = "https://github.com/stevearc/dressing.nvim",              name = "dressing" },

  -- Markview
  { src = "https://github.com/OXY2DEV/markview.nvim",               name = "markview" },
})

-- ──────────────────────────────────────────────────────────────────────────────
-- Plugin setup calls
-- These replace LazyVim's `opts =` / `config =` callbacks.
-- Order matters: dependencies before dependents.
-- ──────────────────────────────────────────────────────────────────────────────

-- Colorscheme
-- vim.cmd.colorscheme("ashen")
vim.cmd("colorscheme emberforge")

-- blink.cmp
require("blink.cmp").setup({
  fuzzy = {
    implementation = "lua",
  },
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
  },
})

-- mini.pairs
require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
  skip_ts = { "string" },
  skip_unbalanced = true,
  markdown = true,
})

-- mini.ai
require("mini.ai").setup({
  n_lines = 500,
  -- treesitter-based objects need nvim-treesitter loaded first (it is, above)
  custom_textobjects = {
    o = require("mini.ai").gen_spec.treesitter({
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }),
    f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
    d = { "%f[%d]%d+" },
    u = require("mini.ai").gen_spec.function_call(),
  },
})

-- ts-comments
require("ts-comments").setup({})

-- lazydev (only activates for lua files)
require("lazydev").setup({
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

-- grug-far
-- No setup() required; configured via keymaps (see keymaps.lua)

-- flash
require("flash").setup({})

-- which-key
require("which-key").setup({
  preset = "helix",
  spec = {
    {
      mode = { "n", "x" },
      { "<leader><tab>", group = "tabs" },
      { "<leader>b",     group = "buffer" },
      { "<leader>c",     group = "code" },
      { "<leader>d",     group = "debug" },
      { "<leader>f",     group = "file/find" },
      { "<leader>g",     group = "git" },
      { "<leader>gh",    group = "hunks" },
      { "<leader>q",     group = "quit/session" },
      { "<leader>r",     group = "flutter/run" },
      { "<leader>s",     group = "search" },
      { "<leader>u",     group = "ui" },
      { "<leader>w",     group = "windows",             proxy = "<c-w>" },
      { "<leader>x",     group = "diagnostics/quickfix" },
      { "[",             group = "prev" },
      { "]",             group = "next" },
      { "g",             group = "goto" },
      { "gs",            group = "surround" },
      { "z",             group = "fold" },
    },
  },
})

-- gitsigns
require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
  on_attach = function(buf)
    local gs = require("gitsigns")
    local map = function(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buf, desc = desc, silent = true })
    end
    map("n", "]h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gs.nav_hunk("next")
      end
    end, "Next Hunk")
    map("n", "[h", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gs.nav_hunk("prev")
      end
    end, "Prev Hunk")
    map("n", "]H", function()
      gs.nav_hunk("last")
    end, "Last Hunk")
    map("n", "[H", function()
      gs.nav_hunk("first")
    end, "First Hunk")
    map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
    map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
    map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
    map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
    map("n", "<leader>ghb", function()
      gs.blame_line({ full = true })
    end, "Blame Line")
    map("n", "<leader>ghB", gs.blame, "Blame Buffer")
    map("n", "<leader>ghd", gs.diffthis, "Diff This")
    map("n", "<leader>ghD", function()
      gs.diffthis("~")
    end, "Diff This ~")
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
  end,
})

-- Snacks (dashboard, notifier, picker/fzf, terminal, etc.)
require("snacks").setup({
  -- Enable the pickers you want; this mirrors LazyVim's defaults
  bigfile = { enabled = true },
  indent = {
    enabled = true,
  },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys",         gap = 1,    padding = 1 },
      { section = "recent_files", indent = 2, padding = 1 },
      { section = "projects",     indent = 2, padding = 1 },
    },
    preset = {
      header = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      keys = {
        {
          icon = " ",
          key = "f",
          desc = "Find File",
          action = function()
            require("snacks").picker.files()
          end,
        },
        {
          icon = " ",
          key = "r",
          desc = "Recent Files",
          action = function()
            require("snacks").picker.recent()
          end,
        },
        {
          icon = " ",
          key = "g",
          desc = "Grep",
          action = function()
            require("snacks").picker.grep()
          end,
        },
        {
          icon = " ",
          key = "e",
          desc = "Explorer",
          action = function()
            require("neo-tree.command").execute({ toggle = true })
          end,
        },
        {
          icon = " ",
          key = "q",
          desc = "Quit",
          action = function()
            vim.cmd("qa")
          end,
        },
        {
          icon = "󰒲 ",
          key = "s",
          desc = "Restore Session",
          action = function()
            require("persistence").load()
          end,
        },
      },
    },
  },
  input = { enabled = true },
  notifier = { enabled = true, timeout = 3000 },
  picker = { enabled = true },
  quickfile = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
})

-- Trouble
require("trouble").setup({ use_diagnostic_signs = true })

-- Todo-comments
require("todo-comments").setup({})

-- neo-tree
require("neo-tree").setup({
  sources = { "filesystem", "buffers", "git_status" },
  open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
    position = "right",
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
      ["<space>"] = "none",
      ["Y"] = {
        function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
        end,
        desc = "Copy Path to Clipboard",
      },
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    git_status = {
      symbols = {
        unstaged = "󰄱",
        staged = "󰱒",
      },
    },
  },
})

-- conform (formatting)
require("conform").setup({
  formatters_by_ft = {
    -- Add your formatters per filetype here, e.g.:
    -- lua  = { "stylua" },
    -- python = { "isort", "black" },
  },
  format_on_save = { timeout_ms = 3000, lsp_fallback = true },
})

-- nvim-lint
if require("lint").setup then
  require("lint").setup({})
end -- setup() may not exist in all versions
-- Register linters per filetype in options.lua via vim.g or here, e.g.:
-- require("lint").linters_by_ft = { python = { "flake8" } }

-- nvim-treesitter
require("nvim-treesitter").setup({
  ensure_installed = {
    "bash",
    "c",
    "diff",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "query",
    "regex",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
})

-- lualine
-- Lualine theme for 'ash'
local c = {
  black = "#121212",
  g_0 = "#e5e5e5",
  g_5 = "#949494",
  g_7 = "#535353",

  red_flame = "#C53030",
  red_ember = "#B14242",
  red_glowing = "#DF6464",
  orange_glow = "#D87C4A",
  g_10 = "#1d1d1d",
}

local ash_lualine = {
  normal = {
    a = { fg = c.black, bg = c.red_flame, gui = "bold" }, -- red background
    b = { fg = c.g_0, bg = c.g_10 },
    c = { fg = c.g_0, bg = c.black },
  },
  insert = {
    a = { fg = c.black, bg = c.red_glowing, gui = "bold" },
    b = { fg = c.g_0, bg = c.g_10 },
    c = { fg = c.g_0, bg = c.black },
  },
  visual = {
    a = { fg = c.black, bg = c.red_ember, gui = "bold" },
    b = { fg = c.g_0, bg = c.g_10 },
    c = { fg = c.g_0, bg = c.black },
  },
  replace = {
    a = { fg = c.black, bg = c.red_flame, gui = "bold" },
    b = { fg = c.g_0, bg = c.g_10 },
    c = { fg = c.g_0, bg = c.black },
  },
  inactive = {
    a = { fg = c.g_5, bg = c.g_10 },
    b = { fg = c.g_5, bg = c.g_10 },
    c = { fg = c.g_5, bg = c.g_10 },
  },
}

require("lualine").setup({
  options = {
    theme = ash_lualine,
    component_separators = "|",
    serction_separators = "",
    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard", "snacks_dashboard" } },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = " " } },
      { "filename",    path = 1 },
    },
    lualine_x = { "diff", "encoding", "fileformat", "filetype" },
    lualine_y = {
      { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
  extensions = { "neo-tree", "trouble", "fzf" },
})

-- indent-blankline
require("ibl").setup({
  indent = { char = "│", tab_char = "│" },
  scope = { enabled = true }, -- mini.indentscope handles the active scope
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})

-- Noice
-- require("noice").setup({
-- 	lsp = {
-- 		override = {
-- 			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 			["vim.lsp.util.stylize_markdown"] = true,
-- 		},
-- 	},
-- 	routes = {
-- 		{
-- 			filter = {
-- 				event = "msg_show",
-- 				any = { { find = "%d+L, %d+B" }, { find = "; after #%d+" }, { find = "; before #%d+" } },
-- 			},
-- 			view = "mini",
-- 		},
-- 	},
-- 	presets = {
-- 		bottom_search = true,
-- 		command_palette = true,
-- 		long_message_to_split = true,
-- 	},
-- })
--
-- persistence (session management)
require("persistence").setup({ dir = vim.fn.stdpath("state") .. "/sessions/" })

-- flutter-tools
require("flutter-tools").setup({})

-- markview
require("markview").setup({})
