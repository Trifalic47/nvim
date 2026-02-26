# Python Debugging

This config uses the full [nvim-dap](https://github.com/mfussenegger/nvim-dap) stack with a Python-specific adapter.

**Plugins involved:**

| Plugin | Role |
|--------|------|
| `nvim-dap` | Core debug engine |
| `nvim-dap-python` | Python adapter (uses `debugpy`) |
| `nvim-dap-ui` | Visual panels (scopes, variables, call stack) |
| `nvim-dap-virtual-text` | Inline variable values while stepping |

---

## Prerequisites

Install `debugpy` in the Python environment you'll be debugging:

```bash
# System Python
pip install debugpy

# Inside a virtualenv
source venv/bin/activate
pip install debugpy

# Conda
conda activate myenv
pip install debugpy
```

> The adapter auto-detects `$VIRTUAL_ENV` and `$CONDA_PREFIX` when Neovim is launched inside an active environment. Otherwise it falls back to `python3`.

---

## Basic Workflow

1. Open your Python file in Neovim.
2. Set a breakpoint: `<leader>b` on the line you want to pause at.
3. Start the debugger: `<F5>`.
4. The DAP UI opens automatically with panels for variables, call stack, and console.
5. Step through code with `<F10>` (over), `<F11>` (into), `<F12>` (out).
6. Stop the session: `<F9>`.

The UI closes automatically when the session ends.

---

## Keybinds (Full Reference)

### Session Control

| Key | Action |
|-----|--------|
| `<F5>` | Start / Continue |
| `<F9>` | Stop / Terminate |
| `<F10>` | Step Over (run current line, stay in same scope) |
| `<F11>` | Step Into (enter the function call) |
| `<F12>` | Step Out (finish current function, return to caller) |

### Breakpoints

| Key | Action |
|-----|--------|
| `<leader>b` | Toggle normal breakpoint |
| `<leader>B` | Conditional breakpoint — pauses only when expression is true |
| `<leader>lp` | Log point — prints a message to the console without pausing |

**Conditional breakpoint example:**
Press `<leader>B`, then type: `x > 10` — execution pauses only when `x` is greater than 10.

### UI & Inspection

| Key | Action |
|-----|--------|
| `<leader>du` | Toggle DAP UI manually |
| `<leader>de` | Evaluate expression under cursor |
| `<leader>de` *(visual)* | Evaluate highlighted expression |

### Python-Specific

| Key | Action |
|-----|--------|
| `<leader>dpm` | Run and debug the **test method** under your cursor |
| `<leader>dpc` | Run and debug the **test class** under your cursor |
| `<leader>dps` *(visual)* | Debug the **selected block** of code |

---

## DAP UI Panels

The UI automatically opens with two areas:

**Left panel:**
- **Scopes** — local, global, and closure variables with current values
- **Breakpoints** — list of all breakpoints set across files
- **Stacks** — call stack showing how you got to the current line
- **Watches** — expressions you add manually to watch continuously

**Bottom panel:**
- **REPL** — interactive console, evaluate any Python expression live
- **Console** — `print()` output and debugger messages

---

## Breakpoint Signs

| Sign | Meaning |
|------|---------|
| `●` (red) | Normal breakpoint |
| `◆` (yellow) | Conditional breakpoint |
| `→` (blue, highlighted line) | Current execution position |

---

## Tips

- **Virtual text**: Variable values appear as inline comments next to each variable while stepping — no need to look at the Scopes panel for simple values.
- **REPL**: While paused, open the REPL panel (`<leader>du`) and type any Python expression to inspect or modify state live.
- **pytest integration**: `<leader>dpm` and `<leader>dpc` work with `pytest` to debug individual tests without running the whole suite.
- **Multiple configs**: For Flask/Django apps, you can add custom `dap.configurations.python` entries in `lua/plugins/dap.lua`.
