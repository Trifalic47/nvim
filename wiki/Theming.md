# Theming

## Colorscheme: vague.nvim

This config uses [vague.nvim](https://github.com/vague2k/vague.nvim) — a near-black dark theme with muted lavender/teal tones. It is ideal for long coding sessions with minimal eye strain.

Configured in `lua/plugins/colorschemes.lua`.

---

## Design Choices

| Option | Value | Why |
|--------|-------|-----|
| Italics | Disabled | Reduces visual noise during long sessions |
| `Normal` bg | `none` | Lets terminal background show through |
| `ColorColumn` | `#161616` | Subtle 125-char column guide, not distracting |
| Transparency | Off | Consistent dark background across all panels |

---

## Switching Themes

To try a different theme, edit `lua/plugins/colorschemes.lua`. Examples:

### rose-pine
```lua
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
```

### tokyonight
```lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-storm")
    end,
  },
}
```

### kanagawa
```lua
return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
```

After editing, run `:Lazy sync` to install the new theme, then restart Neovim.

> **Tip**: After switching themes, run `:Lazy clean` to remove the old theme plugin from disk.

---

## Treesitter Highlighting

Treesitter provides richer, parser-based syntax highlighting (better than regex). Configured in `lua/plugins/treesitter.lua`.

Installed parsers: `python` · `javascript` · `c` · `cpp` · `lua` · `bash`

Install additional parsers:
```
:TSInstall <language>
```

---

## Visual Options (init.lua)

| Option | Value | Effect |
|--------|-------|--------|
| `termguicolors` | `true` | Full 24-bit color support |
| `number` + `relativenumber` | `true` | Hybrid line numbers |
| `signcolumn` | `yes` | Fixed-width gutter (no layout jump with LSP) |
| `wrap` | `false` | No line wrapping |
| `colorcolumn` | `125` | Subtle column guide at 125 chars |
| `cursorline` | — | (can add for cursor row highlight) |
