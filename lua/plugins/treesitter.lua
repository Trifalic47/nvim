return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false, -- As per Wiki: "This plugin does not support lazy-loading"
    build = ':TSUpdate',
    config = function()
      -- 1. Run basic setup
      require('nvim-treesitter').setup({
        -- Only add things here that are actually supported now
        highlight = { enable = true },
        indent = { enable = true },
      })

      -- 2. If you want specific languages always present:
      -- This is the new way to ensure parsers are there without 'ensure_installed'
      require('nvim-treesitter').install({ 'lua', 'vim', 'python','c','javascript'})
    end
  }
}
