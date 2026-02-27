function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"erikbackman/brightburn.vim",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
			})

			-- Theme persistence logic
			local theme_file = vim.fn.stdpath("data") .. "/current_theme.txt"
			local theme = "tokyonight"

			local f = io.open(theme_file, "r")
			if f then
				local content = f:read("*l")
				if content and content ~= "" then
					theme = content
				end
				f:close()
			end

			ColorMyPencils(theme)

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function(args)
					local new_theme = args.match or vim.g.colors_name
					if new_theme then
						local out = io.open(theme_file, "w")
						if out then
							out:write(new_theme .. "\n")
							out:close()
						end
						-- Re-apply transparency after colorscheme change
						vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
						vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
					end
				end,
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "",
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", name = "nord", lazy = false, priority = 1000 },
	{ "neanias/everforest-nvim", name = "everforest", lazy = false, priority = 1000 },
	{ "vagueframework/vague.nvim", name = "vague", lazy = false, priority = 1000 },
}
