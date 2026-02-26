return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			local colors = {
				bg       = "#2b3339",
				fg       = "#d3c6aa",
				green    = "#a7c080",
				yellow   = "#dbbc7f",
				orange   = "#e69875",
				red      = "#e67e80",
				blue     = "#7fbbb3",
				purple   = "#d699b6",
				cyan     = "#83c092",
				grey     = "#4a555b",
			}

			local mode_colors = {
				n  = colors.green,
				i  = colors.blue,
				v  = colors.purple,
				V  = colors.purple,
				c  = colors.yellow,
				R  = colors.red,
				t  = colors.cyan,
				[""] = colors.purple,
			}

			local everforest = {
				normal = {
					a = { fg = colors.bg,  bg = colors.green,  gui = "bold" },
					b = { fg = colors.fg,  bg = colors.grey },
					c = { fg = colors.fg,  bg = colors.bg },
				},
				insert  = { a = { fg = colors.bg, bg = colors.blue,   gui = "bold" } },
				visual  = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
				replace = { a = { fg = colors.bg, bg = colors.red,    gui = "bold" } },
				command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
				inactive = {
					a = { fg = colors.grey, bg = colors.bg },
					b = { fg = colors.grey, bg = colors.bg },
					c = { fg = colors.grey, bg = colors.bg },
				},
			}

			require("lualine").setup({
				options = {
					theme                = everforest,
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
							diff_color = {
								added    = { fg = colors.green },
								modified = { fg = colors.yellow },
								removed  = { fg = colors.red },
							},
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
						{ "progress", color = { fg = colors.fg } },
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
