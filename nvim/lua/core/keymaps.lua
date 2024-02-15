-- Kill buffer
vim.keymap.set("n", "<leader>bk", "<cmd>:bdelete<CR>")

-- Save file
-- vim.keymap.set('n', '<leader>fs', '<cmd>write<cr>')

-- Quit file
-- vim.keymap.set('n', ';q', ':q!<cr>')

-- New file and directory
-- vim.keymap.set('n', ';f', ':e ')
-- vim.keymap.set('n', ';d', ':!mkdir -p ')

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Copied from ThePrimeagen
-- vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", ";s", [[:%s/\<<C-r><C-w>\>/<C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- local opts = { buffer = 0 }
-- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
-- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
-- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
-- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

-- Move.nvim
local moveopts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', moveopts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', moveopts)
vim.keymap.set('v', '<A-j>', ':m \'>+1<CR>gv=gv', moveopts)
vim.keymap.set('v', '<A-k>', ':m \'<-2<CR>gv=gv', moveopts)

-- Copilot
vim.keymap.set("n", "<leader>cp", "<cmd> Copilot enable<CR>")

-- Code navigation
vim.keymap.set("i", "<C-b>", "<ESC>I")
vim.keymap.set("n", "<C-b>", "<ESC>^")
vim.keymap.set("i", "<C-e>", "<ESC>A")
vim.keymap.set("n", "<C-e>", "<ESC>$")
vim.keymap.set("i", "<M-f>", "<ESC><Space>Wi")
vim.keymap.set("i", "<M-b>", "<ESC>Bi")
vim.keymap.set("i", "<M-d>", "<ESC>cW")

-- C-d C-u center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Set tabspace and shiftwidth to 2
-- vim.keymap.set("n", "<leader>2", "<cmd> set ts=2 sw=2<CR>")

-- Set tabspace and shiftwidth to 4
-- vim.keymap.set("n", "<leader>4", "<cmd> set ts=4 sw=4<CR>")

-- Sort selected lines
vim.keymap.set("v", "<leader>s", ":sort<CR>")

-- Reverse sort selected lines
vim.keymap.set("v", "<leader>S", ":sort!<CR>")

-- Haskell Format
vim.keymap.set("n", "<leader>hf", "<cmd>%!stylish-haskell<CR>")

-- Generic Format
vim.keymap.set("n", "<leader>F", "<cmd>Format<CR>")
