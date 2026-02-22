-- Leader key (must be before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── Core Options ──────────────────────────────────────────────────────────────
vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Editing feel
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.isfname:append("@-@")

-- Cursor
vim.opt.guicursor = "n-v-c-i:block"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- File handling (no swap, persistent undo)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Column guide at 125 chars (subtle)
vim.opt.colorcolumn = "125"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#161616" })

-- Remove netrw banner clutter
vim.g.netrw_banner = 0

-- ── Keymaps ───────────────────────────────────────────────────────────────────
require("keymaps")

-- ── Bootstrap lazy.nvim ───────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ── Plugins ───────────────────────────────────────────────────────────────────
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = false }, -- disable update noise
  change_detection = { notify = false },
  ui = {
    border = "none", -- minimal lazy.nvim UI
  },
})
