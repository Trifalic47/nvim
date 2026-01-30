return {
  'stevearc/conform.nvim',
  lazy = false,
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        python = { 'black' },
        lua = { 'stylua' },
        javascript = { 'prettier' },
        bash = { 'shfmt' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    vim.keymap.set('n', '<leader>f', function()
      require('conform').format({ async = true, lsp_fallback = true })
    end, { desc = 'Format buffer' })
  end,
}
