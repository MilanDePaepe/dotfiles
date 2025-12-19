return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.*",
		opts = {
			keymap = {
				preset = "default",
				-- override Tab to accept the current completion
				["<Tab>"] = { "select_and_accept", "fallback" },
				-- optionally disable Ctrl‑y accept
				["<C‑y>"] = {},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
		},
	},
}
