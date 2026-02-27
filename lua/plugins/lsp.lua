return {
	'neovim/nvim-lspconfig',
	lazy = false,
	dependencies = { 'hrsh7th/cmp-nvim-lsp' },
	config = function()
		-- Temporarily hide the lspconfig deprecation warning
		local old_deprecate = vim.deprecate
		vim.deprecate = function() end

		local lspconfig = require('lspconfig')
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		lspconfig.pyright.setup({ capabilities = capabilities })
		lspconfig.ts_ls.setup({ capabilities = capabilities })
		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { 'vim' } },
				},
			},
		})

		-- Restore deprecation warnings
		if old_deprecate then
			vim.deprecate = old_deprecate
		else
			vim.deprecate = nil
		end
	end,
}
