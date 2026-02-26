# Welcome to the Trifalic47/nvim Wiki

A minimal, dark Neovim configuration built for long, distraction-free coding sessions — inspired by ThePrimeagen's setup.

---

## 📖 Wiki Pages

| Page | Description |
|------|-------------|
| [Installation](Installation) | How to install and set up this config |
| [Plugins](Plugins) | Every plugin and what it does |
| [Keybindings](Keybindings) | Full keybind reference |
| [LSP & Completions](LSP-and-Completions) | Language servers and autocompletion |
| [Python Debugging](Python-Debugging) | Full DAP debugger guide |
| [Theming](Theming) | Colorscheme and visual customization |
| [Configuration](Configuration) | How to extend or modify the config |

---

## ⚡ Quick Start

```bash
# Back up existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone
git clone https://github.com/Trifalic47/nvim ~/.config/nvim

# Launch — plugins install automatically
nvim
```

Then install Python debug support:

```bash
pip install debugpy
```

---

## 🗂️ At a Glance

| Feature | Tool |
|---------|------|
| Plugin manager | `lazy.nvim` |
| Colorscheme | `vague.nvim` |
| File explorer | `neo-tree.nvim` |
| Fuzzy finder | `telescope.nvim` |
| Completion | `nvim-cmp` |
| LSP | `nvim-lspconfig` + `mason.nvim` |
| Syntax | `nvim-treesitter` |
| Formatting | `conform.nvim` |
| Debugging | `nvim-dap` + `nvim-dap-python` |

---

Made with ♥ by [Trifalic47](https://github.com/Trifalic47)
