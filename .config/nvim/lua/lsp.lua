-- ~/.config/nvim/lua/lsp.lua
-- Mirrors LazyVim's LSP setup (lazyvim.plugins.lsp).
-- Uses nvim-lspconfig + Mason; no LazyVim helpers needed.

-- ── Diagnostic display ────────────────────────────────────────────────────────
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

-- ── Inlay hints (toggle with <leader>uh) ─────────────────────────────────────
vim.lsp.inlay_hint.enable(true)

-- ── Capabilities (send to every server) ──────────────────────────────────────
-- Merge blink.cmp / nvim-cmp capabilities if you add a completion plugin later.
local capabilities = require("blink.cmp").get_lsp_capabilities()
-- If you add blink.cmp: capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
-- If you add nvim-cmp:  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- File-operation capabilities (needed for Snacks rename, etc.)
capabilities = vim.tbl_deep_extend("force", capabilities, {
  workspace = {
    fileOperations = { didRename = true, willRename = true },
  },
})

-- ── LSP keymaps (attached per buffer) ────────────────────────────────────────
local function on_attach(_, buf)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc, silent = true })
  end

  -- Navigation
  map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
  map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
  map("n", "gr", vim.lsp.buf.references, "References")
  map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
  map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")

  -- Docs / hover
  map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
  map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
  map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

  -- Code actions & rename
  map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
  map("n", "<leader>cR", function()
    require("snacks").rename.rename_file()
  end, "Rename File")

  -- Codelens
  map("n", "<leader>cc", vim.lsp.codelens.run, "Run Codelens")
  map("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh Codelens")

  -- Format
  map({ "n", "x" }, "<leader>cf", function()
    require("conform").format({ bufnr = buf, lsp_fallback = true })
  end, "Format Buffer")

  -- Inlay hints toggle
  map("n", "<leader>uh", function()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
  end, "Toggle Inlay Hints")

  -- Snacks pickers for LSP
  map("n", "<leader>ss", function()
    require("snacks").picker.lsp_symbols()
  end, "LSP Symbols")
  map("n", "<leader>sS", function()
    require("snacks").picker.lsp_workspace_symbols()
  end, "LSP Workspace Symbols")
end

-- ── Attach on_attach to every client ─────────────────────────────────────────
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
  end,
})

-- ── Mason ─────────────────────────────────────────────────────────────────────
require("mason").setup({ ui = { border = "rounded" } })

-- mason-tool-installer keeps listed tools up to date automatically
require("mason-tool-installer").setup({
  ensure_installed = {
    -- Add the language servers / formatters / linters you want Mason to manage.
    -- LazyVim installs none by default; you pick based on your languages.
    -- Examples:
    -- "lua-language-server",
    -- "stylua",
    -- "pyright",
    -- "ruff",
    -- "typescript-language-server",
    -- "eslint-lsp",
    -- "prettier",
  },
})

-- ── mason-lspconfig bridges Mason → lspconfig ─────────────────────────────────
require("mason-lspconfig").setup({
  -- Servers listed here are automatically installed via Mason and then
  -- set up with lspconfig using the defaults below.
  -- Add entries when you need a server:
  -- ensure_installed = { "lua_ls", "pyright", "ts_ls" },
  handlers = {
    -- Default handler: set up every installed server with shared capabilities
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = capabilities,
      })
    end,

    -- ── Per-server overrides ──────────────────────────────────────────────────
    -- Uncomment and adjust as needed:

    -- ["lua_ls"] = function()
    --   require("lspconfig").lua_ls.setup({
    --     capabilities = capabilities,
    --     settings = {
    --       Lua = {
    --         workspace = { checkThirdParty = false },
    --         completion = { callSnippet = "Replace" },
    --         diagnostics = { globals = { "vim" } },
    --       },
    --     },
    --   })
    -- end,

    -- ["pyright"] = function()
    --   require("lspconfig").pyright.setup({
    --     capabilities = capabilities,
    --     settings = {
    --       pyright = { disableOrganizeImports = true },
    --       python  = { analysis = { typeCheckingMode = "standard" } },
    --     },
    --   })
    -- end,
  },
})

-- ── Servers you want configured WITHOUT Mason ─────────────────────────────────
-- Use this block for servers already installed on your $PATH via your package
-- manager (e.g. pacman, apt, brew).  Neovim 0.12 also supports vim.lsp.config
-- directly, but lspconfig still works fine.
--
-- require("lspconfig").some_server.setup({ capabilities = capabilities })
