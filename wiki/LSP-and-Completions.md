# LSP & Completions

## Language Servers

Configured in `lua/plugins/lsp.lua` via `nvim-lspconfig`. Capabilities are shared with `nvim-cmp` for rich completions.

| Language | Server | Install via Mason |
|----------|--------|-------------------|
| Python | `pyright` | `:MasonInstall pyright` |
| JavaScript / TypeScript | `ts_ls` | `:MasonInstall typescript-language-server` |
| C / C++ | `clangd` | `:MasonInstall clangd` |
| Lua | `lua_ls` | `:MasonInstall lua-language-server` |

### Adding a New Language Server

1. Open Neovim and run `:Mason`, find and install the server.
2. Add setup in `lua/plugins/lsp.lua`:

```lua
lspconfig.your_server.setup({ capabilities = capabilities })
```

---

## Mason

Mason (`lua/plugins/mason.lua`) is the installer for LSP servers, formatters, and linters.

```
:Mason          — open the Mason UI
:MasonInstall   — install a specific tool
:MasonUninstall — remove a tool
:MasonUpdate    — update all installed tools
```

---

## Completion (nvim-cmp)

Configured in `lua/plugins/completions.lua`.

### Sources (in priority order)

| Source | Provides |
|--------|----------|
| `nvim_lsp` | Completions from language servers |
| `luasnip` | Snippet completions |
| `buffer` | Words from open buffers |

### Snippet Engine

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) provides pre-built snippets for Python, JS, HTML, Lua, Bash, and more. Snippets expand on `Enter`.

### Keybinds (recap)

| Key | Action |
|-----|--------|
| `Tab` / `Shift+Tab` | Navigate suggestions |
| `Enter` | Accept |
| `Ctrl+Space` | Trigger manually |
| `Ctrl+E` | Dismiss |

---

## Formatting

Configured in `lua/plugins/formatting.lua` via `conform.nvim`.

Format-on-save is enabled with a 500ms timeout and LSP fallback.

| Language | Formatter |
|----------|-----------|
| Python | `black` |
| Lua | `stylua` |
| JavaScript | `prettier` |
| Bash | `shfmt` |

Manual format: `<leader>f`

### Additional Sources (none-ls)

`lua/plugins/none.lua` adds extra sources via `none-ls.nvim`:

- `stylua` (Lua)
- `prettier` (JS/TS/HTML/CSS)
- `isort` (Python import sorting)
- `black` (Python)

Format via LSP with: `<leader>gf`

---

## Diagnostics

LSP diagnostics appear inline via Neovim's built-in virtual text. Default LSP keybinds apply:

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<C-k>` | Signature help |
| `[d` / `]d` | Previous / next diagnostic |
