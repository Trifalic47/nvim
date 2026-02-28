function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#5a5289", bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
	vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

	-- Subtle ColorColumn at 80
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1f1d2e" })

	-- Global Bold Removal
	local groups = {
		"@function", "@method", "@keyword", "@variable", "@type", "@constant",
		"@string", "@comment", "@operator", "@parameter", "@field", "@property"
	}
	for _, group in ipairs(groups) do
		local hl = vim.api.nvim_get_hl(0, { name = group })
		hl.bold = false
		vim.api.nvim_set_hl(0, group, hl)
	end
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
						-- Re-apply all Primeagen overrides
						ColorMyPencils(new_theme)
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
				variant = "moon", 
				dark_variant = "moon",
				disable_background = true,
				disable_float_background = true,
				disable_italics = true,

				highlight_groups = {
					ColorColumn = { bg = 'rose', blend = 10 },
					CursorLine = { bg = 'foam', blend = 10 },
					StatusLine = { fg = 'love', bg = 'love', blend = 10 },
					Search = { bg = 'gold', fg = 'base' },
					TelescopeBorder = { fg = "highlight_high", bg = "none" },
					TelescopeNormal = { bg = "none" },
					TelescopePromptNormal = { bg = "none" },
					TelescopeResultsNormal = { bg = "none" },
					TelescopeSelection = { bg = "highlight_med" },
					TelescopeSelectionCaret = { fg = "love" },
				},

				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", name = "nord", lazy = false, priority = 1000 },
	{ "neanias/everforest-nvim", name = "everforest", lazy = false, priority = 1000 },
	{ "vagueframework/vague.nvim", name = "vague", lazy = false, priority = 1000 },
}
