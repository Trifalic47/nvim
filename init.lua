vim.g.mapleader = " "
vim.opt.guicursor = "n-v-c-i:block"
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2     -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2  -- Size of an indentation
vim.opt.softtabstop = 2 -- Backspace deletes a full indent


require("keymaps")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
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
-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- automatically check for plugin updates
	checker = { enabled = true },
})
-- Sets the column at the 80th character
vim.opt.colorcolumn = "125"

-- To make it subtle like his (not a bright red line)
-- This sets the background of the column to a very dark grey/black
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#161616" })
