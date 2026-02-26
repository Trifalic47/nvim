return {
	{
		"neanias/everforest-nvim",
		name = "everforest",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",      -- "soft" | "medium" | "hard"
				transparent_background_level = 0,
				italics = false,          -- no italics for long sessions
				disable_italic_comments = true,
			})
			vim.cmd.colorscheme("everforest")
		end,
	},
}

