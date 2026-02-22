return {
	{
		"vague2k/vague.nvim",
		name = "vague",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = false,
				style = {
					-- No italics — cleaner for long sessions
					booleans      = "none",
					comments      = "none",
					keywords      = "none",
					strings       = "none",
					functions     = "none",
					variables     = "none",
					operators     = "none",
					types         = "none",
					number        = "none",
				},
				-- Override specific colors for even more contrast if needed
				colors = {},
			})
			vim.cmd.colorscheme("vague")

			-- Keep ColorColumn subtle
			vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#161616" })
		end,
	},
}
