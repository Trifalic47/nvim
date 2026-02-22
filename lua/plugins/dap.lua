return {
	-- Core DAP engine
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- Python adapter
			"mfussenegger/nvim-dap-python",
			-- UI for DAP (breakpoint signs, variable inspector, call stack, etc.)
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
			-- Shows variable values inline while debugging
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap    = require("dap")
			local dapui  = require("dapui")
			local dappy  = require("dap-python")

			-- ── nvim-dap-ui setup ─────────────────────────────────────────────
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
				layouts = {
					{
						-- Left panel: scopes + breakpoints + watches
						elements = {
							{ id = "scopes",      size = 0.5 },
							{ id = "breakpoints", size = 0.2 },
							{ id = "stacks",      size = 0.2 },
							{ id = "watches",     size = 0.1 },
						},
						size = 40,
						position = "left",
					},
					{
						-- Bottom panel: REPL + console output
						elements = {
							{ id = "repl",    size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
				floating = {
					border = "none",
				},
			})

			-- ── Inline variable text ──────────────────────────────────────────
			require("nvim-dap-virtual-text").setup({
				commented = true, -- show as comment so it doesn't distract
			})

			-- ── Auto open/close DAP UI ────────────────────────────────────────
			dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
			dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end

			-- ── Python adapter ────────────────────────────────────────────────
			-- Uses the Python in the active virtualenv, falls back to system python3
			local python_path = (function()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv then
					return venv .. "/bin/python"
				end
				local conda = os.getenv("CONDA_PREFIX")
				if conda then
					return conda .. "/bin/python"
				end
				return "python3" -- system fallback
			end)()

			dappy.setup(python_path)

			-- ── Breakpoint signs ──────────────────────────────────────────────
			vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError",   linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarning", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped",             { text = "→", texthl = "DiagnosticInfo",    linehl = "DiffAdd",     numhl = "" })

			-- ── Keymaps ───────────────────────────────────────────────────────
			local map = vim.keymap.set

			-- Session control
			map("n", "<F5>",        dap.continue,          { desc = "Debug: Start / Continue" })
			map("n", "<F10>",       dap.step_over,         { desc = "Debug: Step Over" })
			map("n", "<F11>",       dap.step_into,         { desc = "Debug: Step Into" })
			map("n", "<F12>",       dap.step_out,          { desc = "Debug: Step Out" })
			map("n", "<F9>",        dap.terminate,         { desc = "Debug: Stop" })

			-- Breakpoints
			map("n", "<leader>b",   dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			map("n", "<leader>B",   function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,                                           { desc = "Debug: Conditional Breakpoint" })
			map("n", "<leader>lp",  function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,                                           { desc = "Debug: Log Point" })

			-- UI toggle
			map("n", "<leader>du",  dapui.toggle,          { desc = "Debug: Toggle UI" })
			map("n", "<leader>de",  dapui.eval,            { desc = "Debug: Eval expression" })
			map("v", "<leader>de",  dapui.eval,            { desc = "Debug: Eval selection" })

			-- Python-specific: run test method / class under cursor
			map("n", "<leader>dpm", function() require("dap-python").test_method() end,  { desc = "Debug: Python test method" })
			map("n", "<leader>dpc", function() require("dap-python").test_class() end,   { desc = "Debug: Python test class" })
			map("v", "<leader>dps", function() require("dap-python").debug_selection() end, { desc = "Debug: Python selection" })
		end,
	},
}
