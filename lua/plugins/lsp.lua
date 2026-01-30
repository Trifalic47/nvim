return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    -- Define the variable properly
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
  end,
}
