return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = false,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = {},
					variables = {},
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

			pcall(vim.cmd.colorscheme, theme)

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function(args)
					local new_theme = args.match or vim.g.colors_name
					if new_theme then
						local out = io.open(theme_file, "w")
						if out then
							out:write(new_theme .. "\n")
							out:close()
						end
					end
				end,
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
	{ "shaunsingh/nord.nvim", name = "nord", lazy = false, priority = 1000 },
	{ "neanias/everforest-nvim", name = "everforest", lazy = false, priority = 1000 },
}

