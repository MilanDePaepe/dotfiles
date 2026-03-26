-- ~/.config/nvim/lua/keymaps.lua
-- Mirrors LazyVim's default keymaps (lazyvim.config.keymaps).
-- No plugin-specific keymaps — those live in plugins.lua next to their setup().
local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end
-- ── Better up/down (respects wrapped lines) ───────────────────────────────────
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down" })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up" })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down" })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up" })

-- ── Window navigation ─────────────────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- ── Window resize ────────────────────────────────────────────────────────────
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- ── Buffer navigation ────────────────────────────────────────────────────────
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
  require("snacks").bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
  require("snacks").bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- ── Clear search highlight ────────────────────────────────────────────────────
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- ── Better indenting (stay in visual mode) ────────────────────────────────────
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- ── Save file ────────────────────────────────────────────────────────────────
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
-- ── Quit ────────────────────────────────────────────────────────────────────
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- ── Lazy (plugin manager) ─────────────────────────────────────────────────────
-- vim.pack has no UI; remove this if you don't want it
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- ── New file ─────────────────────────────────────────────────────────────────
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- ── Location / quickfix list ─────────────────────────────────────────────────
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- ── Diagnostics ──────────────────────────────────────────────────────────────
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- ── Toggle options ────────────────────────────────────────────────────────────
map("n", "<leader>uf", function()
  require("conform").format()
end, { desc = "Format Buffer" })
map("n", "<leader>us", function()
  vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle Wrap" })
map("n", "<leader>uL", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle Relative Number" })
map("n", "<leader>ud", function()
  local d = vim.diagnostic.is_disabled and vim.diagnostic.is_disabled() or false
  if d then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, { desc = "Toggle Diagnostics" })
map("n", "<leader>ul", function()
  vim.opt.number = not vim.opt.number:get()
end, { desc = "Toggle Line Numbers" })
map("n", "<leader>uc", function()
  vim.opt.conceallevel = vim.opt.conceallevel:get() == 0 and 2 or 0
end, { desc = "Toggle Conceal Level" })
map("n", "<leader>uT", function()
  vim.b.ts_highlight = not vim.b.ts_highlight
  if vim.b.ts_highlight then
    vim.treesitter.start()
  else
    vim.treesitter.stop()
  end
end, { desc = "Toggle Treesitter Highlight" })

-- ── Flash ─────────────────────────────────────────────────────────────────────
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })
map({ "n", "o", "x" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
  require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
map("c", "<C-s>", function()
  require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- ── Snacks pickers (replaces Telescope) ──────────────────────────────────────
map("n", "<leader>,", function()
  require("snacks").picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>/", function()
  require("snacks").picker.grep()
end, { desc = "Grep (root)" })
map("n", "<leader>:", function()
  require("snacks").picker.command_history()
end, { desc = "Command History" })
map("n", "<leader><leader>", function()
  require("snacks").picker.files()
end, { desc = "Find Files (root)" })
map("n", "<leader>fb", function()
  require("snacks").picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>ff", function()
  require("snacks").picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
  require("snacks").picker.git_files()
end, { desc = "Find Git Files" })
map("n", "<leader>fr", function()
  require("snacks").picker.recent()
end, { desc = "Recent Files" })
map("n", "<leader>gc", function()
  require("snacks").picker.git_log()
end, { desc = "Git Log" })
map("n", "<leader>gs", function()
  require("snacks").picker.git_status()
end, { desc = "Git Status" })
map("n", "<leader>sb", function()
  require("snacks").picker.lines()
end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function()
  require("snacks").picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function()
  require("snacks").picker.grep()
end, { desc = "Grep" })
map("n", "<leader>sh", function()
  require("snacks").picker.help()
end, { desc = "Help Pages" })
map("n", "<leader>sk", function()
  require("snacks").picker.keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>ss", function()
  require("snacks").picker.lsp_symbols()
end, { desc = "LSP Symbols" })
map("n", "<leader>sd", function()
  require("snacks").picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>sD", function()
  require("snacks").picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })
map({ "n", "x" }, "<leader>sw", function()
  require("snacks").picker.grep_word()
end, { desc = "Word (root dir)" })
--
-- ── Grug-far (search & replace) ──────────────────────────────────────────────
map({ "n", "x" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({ transient = true, prefills = { filesFilter = ext ~= "" and "*." .. ext or nil } })
end, { desc = "Search and Replace" })

-- ── Trouble ───────────────────────────────────────────────────────────────────
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
  "n",
  "<leader>cl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "LSP Definitions / refs (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- ── Todo-comments ─────────────────────────────────────────────────────────────
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Prev Todo Comment" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo (Trouble)" })
map(
  "n",
  "<leader>xT",
  "<cmd>Trouble todo toggle filter={tag={TODO,FIX,FIXME}}<cr>",
  { desc = "Todo/Fix/Fixme (Trouble)" }
)
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
map("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })

-- neo-tree
map("n", "<leader>fe", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
end, { desc = "Explorer (cwd)" })
map("n", "<leader>fE", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.fn.expand("%:p:h") })
end, { desc = "Explorer (file dir)" })
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer (cwd)", remap = true })
map("n", "<leader>E", "<leader>fE", { desc = "Explorer (file dir)", remap = true })

-- ── Session management (persistence.nvim) ─────────────────────────────────────
map("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore Session" })
map("n", "<leader>qS", function()
  require("persistence").select()
end, { desc = "Select Session" })
map("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })
map("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Don't Save Current Session" })

-- ── Tabs ──────────────────────────────────────────────────────────────────────
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- ── Terminal ──────────────────────────────────────────────────────────────────
map("n", "<leader>ft", function()
  require("snacks").terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", function()
  require("snacks").terminal(nil, { cwd = vim.uv.cwd() })
end, { desc = "Terminal (root)" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- ── Flutter ───────────────────────────────────────────────────────────────────
map("n", "<leader>rr", "<cmd>FlutterRun<cr>", { desc = "Flutter Run" })
map("n", "<leader>rq", "<cmd>FlutterQuit<cr>", { desc = "Flutter Quit" })
map("n", "<leader>rl", "<cmd>FlutterLogToggle<cr>", { desc = "Flutter Log Toggle" })
map("n", "<leader>rR", "<cmd>FlutterRestart<cr>", { desc = "Flutter Restart" })
