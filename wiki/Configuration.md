# Configuration

This page explains how to extend or modify the config to suit your workflow.

---

## Adding a Plugin

Create a new file in `lua/plugins/` (or add to an existing one). lazy.nvim auto-discovers all files in that directory via `{ import = "plugins" }`.

**Example** — adding `which-key.nvim`:

```lua
-- lua/plugins/whichkey.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({})
  end,
}
```

Restart Neovim and run `:Lazy sync`.

---

## Adding a New LSP Server

1. Install the server via `:Mason`
2. Add to `lua/plugins/lsp.lua`:

```lua
lspconfig.your_server.setup({ capabilities = capabilities })
```

---

## Adding a New Formatter

Edit `lua/plugins/formatting.lua`:

```lua
formatters_by_ft = {
  python     = { "black" },
  lua        = { "stylua" },
  javascript = { "prettier" },
  bash       = { "shfmt" },
  rust       = { "rustfmt" },   -- add here
},
```

Install the formatter tool (via Mason or the system package manager).

---

## Adding a Keymap

Edit `lua/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>hw", function()
  print("Hello, World!")
end, { desc = "Say hello" })
```

**Mode codes:**

| Code | Mode |
|------|------|
| `n` | Normal |
| `i` | Insert |
| `v` | Visual |
| `x` | Visual block |
| `t` | Terminal |

---

## Adding a Treesitter Parser

Edit `lua/plugins/treesitter.lua`:

```lua
ensure_installed = { "python", "c", "lua", "javascript", "cpp", "bash", "rust" },
```

Or install ad-hoc: `:TSInstall rust`

---

## Core Options Reference

All core Neovim options live in `init.lua`. Common things you may want to tweak:

| Option | Default | Change to |
|--------|---------|-----------|
| `tabstop` | `2` | `4` for Python PEP 8 |
| `colorcolumn` | `"125"` | `"80"` for stricter column |
| `scrolloff` | `8` | `4` for less aggressive centering |
| `relativenumber` | `true` | `false` for absolute only |
| `wrap` | `false` | `true` if you prefer wrapped lines |

---

## File Structure Reference

```
~/.config/nvim/
├── init.lua                   # Entry point: options, keymaps, lazy bootstrap
├── lazy-lock.json             # Plugin version lockfile (commit-pinned)
└── lua/
    ├── keymaps.lua            # All non-plugin keybindings
    └── plugins/
        ├── alpha.lua          # Dashboard
        ├── colorschemes.lua   # Theme (vague.nvim)
        ├── completions.lua    # nvim-cmp
        ├── dap.lua            # Python debugger
        ├── formatting.lua     # conform.nvim
        ├── lsp.lua            # nvim-lspconfig
        ├── mason.lua          # Mason installer
        ├── neotree.lua        # File explorer
        ├── none.lua           # none-ls sources
        ├── telescope.lua      # Fuzzy finder
        └── treesitter.lua     # Syntax highlighting
```

---

## Updating

Inside Neovim:

```
:Lazy sync    — update all plugins
:Lazy clean   — remove unused plugins
:TSUpdate     — update treesitter parsers
:MasonUpdate  — update LSP servers / formatters
```
