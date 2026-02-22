return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- auto-close when it's the only window
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = false, -- less clutter in the tree
			window = {
				width = 30,
				position = "left",
				mappings = {
					["<space>"] = "none", -- don't intercept leader
				},
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = {
					enabled = true, -- highlight current file automatically
				},
				use_libuv_file_watcher = true,
			},
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 0,
					with_markers = false, -- no indent lines — cleaner look
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
				git_status = {
					symbols = {
						added     = "",
						modified  = "",
						deleted   = "✗",
						renamed   = "➜",
						untracked = "?",
						ignored   = "",
						unstaged  = "○",
						staged    = "●",
						conflict  = "",
					},
				},
			},
		})

		-- Ctrl+N: proper toggle (open if closed, close if open)
		vim.keymap.set("n", "<C-n>", function()
			require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
		end, { desc = "Toggle Neo-tree" })

		-- Buffers floating view
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { silent = true })
	end,
}
