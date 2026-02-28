return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_tool_installer = require("mason-tool-installer")

      -- Initialize Mason
      mason.setup({
        ui = {
          border = "none",
        },
      })

      -- Automatically install these tools
      mason_tool_installer.setup({
        ensure_installed = {
          "stylua", -- For formatting Lua (Fixes your current error)
          "black", -- For Python formatting
          "isort", -- For Python import sorting
          "prettier", -- For JavaScript/Web formatting
          "shfmt", -- For Bash scripting
        },
      })
    end,
  },
}
