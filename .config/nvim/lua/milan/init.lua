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
