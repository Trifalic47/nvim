return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Rely on Tokyonight's excellent native Neo-tree highlights

		require("neo-tree").setup({
			close_if_last_window    = true,
			popup_border_style      = "rounded",
			enable_git_status       = true,
			enable_diagnostics      = false,
			use_popups_for_input    = true,

			-- No tabs bar — filesystem only
			source_selector = { winbar = false, statusline = false },

			window = {
				width    = 30,
				position = "left",
				padding  = 1,
				mappings = {
					["<space>"] = "none",
					["<cr>"]    = "open",
					["l"]       = "open",
					["h"]       = "close_node",
					["v"]       = "open_vsplit",
					["s"]       = "open_split",
					["a"]       = { "add", config = { show_path = "relative" } },
					["d"]       = "delete",
					["r"]       = "rename",
					["y"]       = "copy_to_clipboard",
					["x"]       = "cut_to_clipboard",
					["p"]       = "paste_from_clipboard",
					["R"]       = "refresh",
					["?"]       = "show_help",
				},
			},

			filesystem = {
				filtered_items = {
					visible         = false,
					hide_dotfiles   = false,
					hide_gitignored = true,
					hide_by_name    = { ".DS_Store", "thumbs.db" },
				},
				follow_current_file = {
					enabled         = true,
					leave_dirs_open = false,
				},
				use_libuv_file_watcher = true,
				group_empty_dirs       = true,
			},

			default_component_configs = {
				container = { enable_character_fade = true },
				indent = {
					indent_size        = 2,
					padding            = 0,
					with_markers       = true,
					indent_marker      = "│",
					last_indent_marker = "└",
					highlight          = "NeoTreeIndentMarker",
					with_expanders     = true,
					expander_collapsed = "",
					expander_expanded  = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed     = "",
					folder_open       = "",
					folder_empty      = "󰜌",
					folder_empty_open = "󰜌",
					default           = "󰈚",
					highlight         = "NeoTreeFileIcon",
				},
				modified = { symbol = "●", highlight = "NeoTreeModified" },
				name = {
					trailing_slash        = false,
					use_git_status_colors = true,
					highlight             = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						added     = " ",
						modified  = " ",
						deleted   = " ",
						renamed   = "󰁕 ",
						untracked = " ",
						ignored   = " ",
						unstaged  = "󰄱 ",
						staged    = " ",
						conflict  = " ",
					},
				},
			},
		})

		-- Ctrl+N: toggle Neo-tree (filesystem only)
		vim.keymap.set("n", "<C-n>", function()
			require("neo-tree.command").execute({ toggle = true, source = "filesystem", dir = vim.loop.cwd() })
		end, { desc = "Toggle Neo-tree" })

		-- Leader+bf: floating buffers view
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { silent = true })
	end,
}
