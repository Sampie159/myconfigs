local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Git plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Copilot
  'github/copilot.vim',

  -- Copilot.lua
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
  },

  -- Todo Comments
  'folke/todo-comments.nvim',

  -- Copilot-cmp
  -- 'zbirenbaum/copilot-cmp',

  -- Lazygit
  'kdheepak/lazygit.nvim',

  -- Haskell Tools
  {
    'mrcjkb/haskell-tools.nvim',
    branch = '1.x.x',
  },

  -- Debugging
  'mfussenegger/nvim-dap',

  -- Null Ls
  'jose-elias-alvarez/null-ls.nvim',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Typescript
  'jose-elias-alvarez/typescript.nvim',

  -- Move.nvim
  "fedepujol/move.nvim",

  -- Oil
  'stevearc/oil.nvim',

  -- Harpoon
  'theprimeagen/harpoon',

  -- vim-be-good
  'theprimeagen/vim-be-good',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      { 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' },

      'folke/neodev.nvim',
    },
  },

  -- Plenary
  'nvim-lua/plenary.nvim',

  -- ts autotag
  'windwp/nvim-ts-autotag',

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-buffer' },
  },

  -- Vim/tmux
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  -- Which key
  { 'folke/which-key.nvim',          opts = {} },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Catppuccin
  {
    "catppuccin/nvim", name = "catppuccin"
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'papercolor_light',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Fuzzy Finder
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- TreeSitter Context
  'nvim-treesitter/nvim-treesitter-context',

  -- Web devicons
  'nvim-tree/nvim-web-devicons',
}

require('lazy').setup(plugins, {})
