return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function()
			vim.keymap.set("n", "<leader>n", "<CMD>Neotree<CR>")
			vim.keymap.set("n", "<leader>ee", "<CMD>Neotree toggle<CR>")
			vim.keymap.set("n", "<leader>eg", "<CMD>Neotree git_status<CR>")
		end,
	},
}
