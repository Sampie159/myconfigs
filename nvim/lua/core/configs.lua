-- Leader as <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Fat Cursor
vim.opt.guicursor = ""

-- Search highlight
vim.o.hlsearch = false

-- Line numbers default
vim.wo.number = true

-- Enable mouse
vim.o.mouse = 'a'

-- Sync clipboard
vim.o.clipboard = 'unnamedplus'

-- Break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Relative numbers
vim.o.relativenumber = true

-- Tab stop
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = 2

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set colorscheme
vim.o.termguicolors = true

-- Set scrolloff
vim.o.scrolloff = 8

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
