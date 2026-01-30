return {
  'nvim-treesitter/nvim-treesitter',
  -- This line forces the older, stable version that won't break your config
  branch = 'master', 
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { 'python', 'c', 'lua', 'javascript', 'cpp', 'bash' },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
