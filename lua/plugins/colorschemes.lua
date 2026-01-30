return {
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true, -- This makes it inherit your terminal's black background
				style = {
					boolean = "bold",
					number = "none",
					float = "none",
					error = "none",
					comments = "italic", -- Prime's setup is usually clean, but you can toggle this
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "none",
					strings = "none",
					variables = "none",
					keywords = "none",
				},
			})
			vim.cmd.colorscheme("vague")
		end,
	},
}
