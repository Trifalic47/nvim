# Installation

## Prerequisites

| Requirement | Minimum Version | Notes |
|-------------|----------------|-------|
| Neovim | `0.10+` | [Download](https://github.com/neovim/neovim/releases) |
| Git | Any | For lazy.nvim and plugins |
| Nerd Font | Any | Icons in Neo-tree and statusline — [nerdfonts.com](https://www.nerdfonts.com) |
| `ripgrep` | Any | Required for Telescope live grep |
| Node.js | `16+` | Required by some LSP servers (ts_ls) |
| Python 3 | `3.8+` | Required for Pyright LSP and debugger |

---

## Install

```bash
# 1. Backup your existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak

# 2. Clone this repo
git clone https://github.com/Trifalic47/nvim ~/.config/nvim

# 3. Open Neovim — lazy.nvim installs all plugins automatically
nvim
```

On first launch you will see lazy.nvim's progress window installing all plugins. Wait for it to finish, then restart Neovim.

---

## Language Servers

Open Neovim and run `:Mason` to open the Mason UI. The following servers are pre-configured and can be installed from there:

| Server | Language |
|--------|----------|
| `pyright` | Python |
| `ts_ls` | JavaScript / TypeScript |
| `clangd` | C / C++ |
| `lua_ls` | Lua |

Press `i` on any server in the Mason UI to install it.

---

## Python Debugging

The DAP debugger requires `debugpy`:

```bash
# System Python
pip install debugpy

# Or inside a virtualenv (recommended)
source venv/bin/activate
pip install debugpy
```

The adapter auto-detects `$VIRTUAL_ENV` and `$CONDA_PREFIX` when Neovim is launched inside an active environment.

---

## Formatters

Install formatters via Mason (`:Mason`) or directly:

```bash
pip install black isort          # Python
npm install -g prettier          # JavaScript
cargo install stylua             # Lua
```

---

## Updating Plugins

Inside Neovim:

```
:Lazy sync
```

To remove unused plugins (e.g. old themes):

```
:Lazy clean
```
