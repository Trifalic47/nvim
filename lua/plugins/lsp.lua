return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    -- DO NOT just 'require' it at the top; define it as a variable here
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Corrected server setups
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.clangd.setup({ capabilities = capabilities })
    
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })
  end,
}
