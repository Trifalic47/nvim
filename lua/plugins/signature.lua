return {
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			hint_enable = false,          -- disable inline virtual text hint, use popup only
			floating_window = true,        -- show a floating popup with signature
			floating_window_above_cur_line = true,
			handler_opts = {
				border = "rounded",        -- popup border style
			},
			toggle_key = "<C-k>",          -- manually toggle signature with Ctrl+k
			select_signature_key = "<C-n>", -- cycle through overloads (if any)
			auto_close_after = nil,        -- keep open until you close paren
		},
	},
}
