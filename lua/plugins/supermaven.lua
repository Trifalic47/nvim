return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-a>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = { "cpp" }, -- Optional: Add filetypes to ignore
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      log_level = "info", -- "info", "warn", "error", "debug"
      disable_inline_completion = false, -- enables "ghost text"
      disable_keymaps = false,
      condition = function()
        return false -- condition to disable supermaven, false means it's always on
      end,
    })

    -- Toggle Supermaven on/off with <leader>st
    vim.keymap.set("n", "<leader>st", "<cmd>SupermavenToggle<cr>", { desc = "Toggle Supermaven" })
  end,
}
