return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For completions
    "onsails/lspkind.nvim", -- Optional: For icons
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: For better UI
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        agent = {
          adapter = "gemini",
        },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "GEMINI_API_KEY",
            },
          })
        end,
      },
    })

    -- Keymaps
    local map = vim.keymap.set
    map({ "n", "v" }, "<leader>ga", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
    map({ "n", "v" }, "<leader>gc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
    map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to AI Chat" })
    map({ "n", "v" }, "<leader>gi", "<cmd>CodeCompanion<cr>", { desc = "Inline AI Prompt" })

    -- Expand 'cc' to 'CodeCompanion' in the command line
    vim.cmd([[cabbrev cc CodeCompanion]])
  end,
}
