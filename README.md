<div align="center">

# 🌑 nvim

**A minimal, dark Neovim configuration built for long coding sessions.**

*Inspired by ThePrimeagen's setup — distraction-free, fast, and practical.*

![Neovim](https://img.shields.io/badge/Neovim-0.10+-green?style=flat-square&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-5.1-blue?style=flat-square&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-purple?style=flat-square)

</div>

---

## ✨ Features

- 🎨 **Vague colorscheme** — near-black background, muted tones, zero eye strain
- ⚡ **lazy.nvim** — fast plugin loading with lazy evaluation
- 🌳 **Neo-tree** — file explorer that actually toggles (`Ctrl+N`)
- 🔭 **Telescope** — fuzzy file finding and live grep
- 🧠 **LSP** — auto-completion via `nvim-cmp` + `nvim-lspconfig`
- 🐛 **Python Debugger** — full DAP setup with inline variable text and UI panels
- 🌲 **Treesitter** — rich syntax highlighting for Python, JS, C/C++, Lua, Bash
- 🖋️ **Auto-formatting** — on-save formatting via `conform.nvim`
- 📸 **Mason** — easy LSP/formatter installer

---

## 📁 Structure

```
~/.config/nvim/
├── init.lua                  # Core options, lazy.nvim bootstrap
├── lua/
│   ├── keymaps.lua           # All keybindings
│   └── plugins/
│       ├── alpha.lua         # Dashboard
│       ├── colorschemes.lua  # Vague theme
│       ├── completions.lua   # nvim-cmp setup
│       ├── dap.lua           # Python debugger (DAP)
│       ├── formatting.lua    # conform.nvim
│       ├── lsp.lua           # LSP servers
│       ├── mason.lua         # Mason installer
│       ├── neotree.lua       # File explorer
│       ├── none.lua          # none-ls sources
│       ├── telescope.lua     # Fuzzy finder
│       └── treesitter.lua    # Syntax highlighting
```

---

## ⌨️ Keybinds

> **Leader key**: `Space`

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+N` | Toggle Neo-tree file explorer |
| `Ctrl+P` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader><leader>` | Recent files |
| `<leader>pv` | Open netrw |
| `<C-d>` / `<C-u>` | Scroll half-page, cursor stays centered |

### Editing

| Key | Action |
|-----|--------|
| `<leader>y` | Yank to system clipboard |
| `<leader>d` | Delete to void (don't pollute yank register) |
| `<leader>p` *(visual)* | Paste without overwriting register |
| `J` / `K` *(visual)* | Move selected block down / up |
| `J` *(normal)* | Join line, cursor stays in place |
| `<leader>s` | Rename word under cursor across file |
| `<leader>x` | Make current file executable |
| `<leader>f` | Format buffer |

### Search

| Key | Action |
|-----|--------|
| `n` / `N` | Next/prev search match, centered |

### Completion

| Key | Action |
|-----|--------|
| `Tab` / `Shift+Tab` | Navigate suggestions |
| `Enter` | Accept suggestion |
| `Ctrl+Space` | Trigger completion |
| `Ctrl+E` | Abort completion |
| `Ctrl+B` / `Ctrl+F` | Scroll docs |

### Python Debugger (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Start / Continue |
| `<F9>` | Stop |
| `<F10>` | Step Over |
| `<F11>` | Step Into |
| `<F12>` | Step Out |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |
| `<leader>lp` | Log point |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Eval expression / selection |
| `<leader>dpm` | Debug test method under cursor |
| `<leader>dpc` | Debug test class under cursor |

---

## 🖥️ LSP Servers

Configured via `nvim-lspconfig` + Mason:

| Language | Server |
|----------|--------|
| Python | `pyright` |
| JavaScript/TS | `ts_ls` |
| C / C++ | `clangd` |
| Lua | `lua_ls` |

---

## 🚀 Installation

**Prerequisites**: Neovim `>= 0.10`, `git`, a [Nerd Font](https://www.nerdfonts.com/)

```bash
# Back up existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/Trifalic47/nvim ~/.config/nvim

# Launch Neovim — lazy.nvim auto-installs everything on first start
nvim
```

For Python debugging, install `debugpy` in your environment:

```bash
pip install debugpy
```

---

## 🔧 Language Servers via Mason

Open Neovim and run:

```
:Mason
```

Then install any additional servers you need.

---

<div align="center">

Made with ♥ by [Trifalic47](https://github.com/Trifalic47)

</div>
