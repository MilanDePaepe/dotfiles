require("milan.options")
require("milan.keymaps")
require("milan.highlight")
require("milan.lazy")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		require("milan.java")
	end,
})

-- Haskell indentation settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "haskell",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true
	end,
})
