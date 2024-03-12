-- Main plugins

-- require('core.plugin_config.oil_config')
require('core.plugin_config.harpoon_config')
require('core.plugin_config.webdevicons_config')
require('core.plugin_config.cmp_config')
-- require('core.plugin_config.copilot_config')
require('core.plugin_config.telescope_config')
require('core.plugin_config.treesitter_config')
require('core.plugin_config.lsp_config')
require('core.plugin_config.luasnip_config')
require('core.plugin_config.todo-comments_config')

-- Themes

require('core.plugin_config.catppuccin_config')
require('core.plugin_config.oxocarbon_config')
require('core.plugin_config.gruvbox_config')

-- I got tired of creating separate files for each plugin configuration, so I'll
-- just put them all here. I'll try to keep it organized, though.

require('mini.surround').setup()

-- Git stuf
    -- Neogit
require('neogit').setup{}
vim.keymap.set("n", "<leader>gn", "<cmd>Neogit<CR>")

    -- Lazygit
vim.keymap.set("n", "<leader>gl", "<CMD>LazyGit<CR>")

-- Orgmode
local orgmode = require('orgmode')
orgmode.setup_ts_grammar()
orgmode.setup({
    org_agenda_files = {'~/org/**/*'},
    org_default_notes_file = '~/org/notes.org',
    mappings = {
        org = {
            org_toggle_checkbox = '<C-b>',
        },
    },
})
