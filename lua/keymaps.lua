local map = vim.keymap.set

-- File explorer (netrw fallback)
map("n", "<leader>pv", vim.cmd.Ex)

-- Disable accidental ex mode
map("n", "Q", "<nop>")

-- Centered scrolling (ThePrimeagen staple)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Centered search navigation
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Join line without moving cursor
map("n", "J", "mzJ`z")

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Paste without losing register contents
map("x", "p", [["_dP]])
map("x", "<leader>p", [["_dP]])

-- Visual mode indenting
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Delete to void register (don't pollute yank)
map({ "n", "v" }, "<leader>d", [["_d]])

-- Quick word substitution across file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
