return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>f", require("fzf-lua").files, { desc = "FZF Files" })
			vim.keymap.set("n", "<leader>g", require("fzf-lua").live_grep, { desc = "FZF Grep" })
			vim.keymap.set("n", "<leader><space>", require("fzf-lua").buffers, { desc = "FZF Buffers" })
			vim.keymap.set({ "v", "n" }, "<leader>cn", function()
				vim.lsp.buf.rename()
			end, { noremap = true, silent = true, desc = "Code Rename" })
		end,
	},
}
