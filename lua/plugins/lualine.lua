return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					theme                = "auto",
					component_separators = { left = "│", right = "│" },
					section_separators   = { left = "", right = "" },
					globalstatus         = true,   -- single statusline across all splits
					refresh              = { statusline = 200 },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str) return " " .. str:sub(1, 1) end, -- single letter + icon
						},
					},
					lualine_b = {
						{ "branch", icon = "" },
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
							colored = true,
						},
					},
					lualine_c = {
						{
							"filename",
							path = 1,              -- show relative path
							symbols = {
								modified = "  ",
								readonly = "  ",
								unnamed  = "  No Name",
							},
						},
					},
					lualine_x = {
						{
							"diagnostics",
							sources  = { "nvim_lsp" },
							symbols  = { error = " ", warn = " ", info = " ", hint = " " },
							colored  = true,
							update_in_insert = false,
						},
						{ "filetype", icon_only = false },
					},
					lualine_y = {
						{ "progress" },
					},
					lualine_z = {
						{ "location" },   -- line:col
					},
				},
				inactive_sections = {
					lualine_c = { { "filename", path = 1 } },
					lualine_x = { "location" },
				},
			})
		end,
	},
}
