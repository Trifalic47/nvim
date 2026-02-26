# Plugins

All plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and live in `lua/plugins/`.

---

## Plugin Manager

### [lazy.nvim](https://github.com/folke/lazy.nvim)

Bootstrapped in `init.lua`. Loads plugins lazily for fast startup.

**Usage inside Neovim:**

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin dashboard |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | View startup time per plugin |

---

## Colorscheme

### [vague.nvim](https://github.com/vague2k/vague.nvim)
`lua/plugins/colorschemes.lua`

Near-black background, muted lavender/teal syntax tones. Italics disabled for reduced visual noise during long sessions.

---

## File Explorer

### [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
`lua/plugins/neotree.lua`

File tree explorer with Git status indicators and auto-follow of the current file.

**Key config:**
- `close_if_last_window = true` — closes automatically when it's the last open window
- No indent markers for a cleaner tree view
- Dotfiles visible, gitignored files hidden

---

## Fuzzy Finder

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
`lua/plugins/telescope.lua`

Fuzzy finder for files, grep, and buffers. Uses `telescope-ui-select.nvim` for code actions.

---

## Completion

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
`lua/plugins/completions.lua`

Autocompletion engine. Sources:
- `nvim_lsp` — from language servers
- `luasnip` — from snippet engine
- `buffer` — from open buffers

Borderless popup window for minimal visual footprint.

### [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

Snippet engine with a large library of pre-built snippets for most languages.

---

## LSP

### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
`lua/plugins/lsp.lua`

Configures language servers. See [LSP & Completions](LSP-and-Completions) for full details.

### [mason.nvim](https://github.com/williamboman/mason.nvim)
`lua/plugins/mason.lua`

GUI installer for LSP servers, formatters, and linters. Run `:Mason` to open.

---

## Syntax Highlighting

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
`lua/plugins/treesitter.lua`

Parser-based syntax highlighting and indentation. Installed parsers:

`python` · `javascript` · `c` · `cpp` · `lua` · `bash`

---

## Formatting

### [conform.nvim](https://github.com/stevearc/conform.nvim)
`lua/plugins/formatting.lua`

Format-on-save with the following formatters:

| Language | Formatter |
|----------|-----------|
| Python | `black` |
| Lua | `stylua` |
| JavaScript | `prettier` |
| Bash | `shfmt` |

### [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
`lua/plugins/none.lua`

Additional lint and format sources (stylua, prettier, isort, black).

---

## Python Debugging

### [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) + [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
`lua/plugins/dap.lua`

Full Python debugging stack. See [Python Debugging](Python-Debugging) for full details.

---

## Dashboard

### [alpha-nvim](https://github.com/goolord/alpha-nvim)
`lua/plugins/alpha.lua`

Startup dashboard with the Neovim logo. Loads on empty `nvim` invocations.
