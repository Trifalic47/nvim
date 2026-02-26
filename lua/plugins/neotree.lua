return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Everforest-matched highlights
		vim.api.nvim_set_hl(0, "NeoTreeNormal",        { bg = "#272e33", fg = "#d3c6aa" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC",      { bg = "#272e33", fg = "#d3c6aa" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer",   { bg = "#272e33", fg = "#272e33" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator",  { fg = "#272e33", bg = "#272e33" })
		vim.api.nvim_set_hl(0, "NeoTreeRootName",      { fg = "#a7c080", bold = true })
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#7fbbb3" })
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#7fbbb3" })
		vim.api.nvim_set_hl(0, "NeoTreeFileName",      { fg = "#d3c6aa" })
		vim.api.nvim_set_hl(0, "NeoTreeFileIcon",      { fg = "#a7c080" })
		vim.api.nvim_set_hl(0, "NeoTreeCursorLine",    { bg = "#3a464c" })
		vim.api.nvim_set_hl(0, "NeoTreeIndentMarker",  { fg = "#3d4a4f" })
		vim.api.nvim_set_hl(0, "NeoTreeExpander",      { fg = "#7fbbb3" })
		vim.api.nvim_set_hl(0, "NeoTreeGitAdded",      { fg = "#a7c080" })
		vim.api.nvim_set_hl(0, "NeoTreeGitModified",   { fg = "#dbbc7f" })
		vim.api.nvim_set_hl(0, "NeoTreeGitDeleted",    { fg = "#e67e80" })
		vim.api.nvim_set_hl(0, "NeoTreeGitUntracked",  { fg = "#d699b6" })
		vim.api.nvim_set_hl(0, "NeoTreeGitIgnored",    { fg = "#4a555b" })
		vim.api.nvim_set_hl(0, "NeoTreeGitConflict",   { fg = "#e69875", bold = true })

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
