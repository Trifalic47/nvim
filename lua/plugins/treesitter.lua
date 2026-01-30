return {
  'nvim-treesitter/nvim-treesitter',
  -- Add this line to use the stable branch
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
