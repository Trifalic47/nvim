# Keybindings

> **Leader key**: `Space`

---

## Navigation

| Key | Action |
|-----|--------|
| `Ctrl+N` | Toggle Neo-tree file explorer |
| `Ctrl+P` | Find files (Telescope) |
| `<leader>fg` | Live grep across project (Telescope) |
| `<leader><leader>` | Recent files |
| `<leader>pv` | Open netrw file browser |
| `<leader>bf` | Open buffer list (floating Neo-tree) |
| `<C-d>` | Scroll down half-page, cursor centered |
| `<C-u>` | Scroll up half-page, cursor centered |

---

## Search

| Key | Action |
|-----|--------|
| `n` | Next search match (centered in screen) |
| `N` | Previous search match (centered in screen) |

> Search highlights clear automatically — `hlsearch` is off.

---

## Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | Normal | Join line below without moving cursor |
| `J` | Visual | Move selected block **down** |
| `K` | Visual | Move selected block **up** |
| `<leader>y` | Normal / Visual | Yank to **system clipboard** |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<leader>p` | Visual | Paste without overwriting yank register |
| `<leader>d` | Normal / Visual | Delete to void register (preserves yank) |
| `<leader>s` | Normal | Rename word under cursor across entire file |
| `<leader>x` | Normal | Make current file executable (`chmod +x`) |
| `Q` | Normal | Disabled (prevents accidental ex mode) |

---

## Formatting

| Key | Action |
|-----|--------|
| `<leader>f` | Format current buffer (conform.nvim) |
| `<leader>gf` | Format via LSP |

---

## Completion (insert mode)

| Key | Action |
|-----|--------|
| `Tab` | Select next suggestion |
| `Shift+Tab` | Select previous suggestion |
| `Enter` | Confirm / accept suggestion |
| `Ctrl+Space` | Trigger completion manually |
| `Ctrl+E` | Abort / close popup |
| `Ctrl+B` | Scroll documentation popup up |
| `Ctrl+F` | Scroll documentation popup down |

---

## Python Debugging (DAP)

### Session Control

| Key | Action |
|-----|--------|
| `<F5>` | Start debug session / Continue |
| `<F9>` | Stop / Terminate session |
| `<F10>` | Step Over |
| `<F11>` | Step Into |
| `<F12>` | Step Out |

### Breakpoints

| Key | Action |
|-----|--------|
| `<leader>b` | Toggle breakpoint on current line |
| `<leader>B` | Set conditional breakpoint (prompts for expression) |
| `<leader>lp` | Set log point (prints message, no pause) |

### UI & Inspection

| Key | Action |
|-----|--------|
| `<leader>du` | Toggle DAP UI panels |
| `<leader>de` | Evaluate expression under cursor |
| `<leader>de` *(visual)* | Evaluate selected expression |

### Python-Specific

| Key | Action |
|-----|--------|
| `<leader>dpm` | Debug test **method** under cursor |
| `<leader>dpc` | Debug test **class** under cursor |
| `<leader>dps` *(visual)* | Debug selected code block |
