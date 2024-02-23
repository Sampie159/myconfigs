-- Main plugins

require('core.plugin_config.oil_config')
require('core.plugin_config.lazygit_config')
require('core.plugin_config.harpoon_config')
require('core.plugin_config.webdevicons_config')
require('core.plugin_config.cmp_config')
require('core.plugin_config.copilot_config')
require('core.plugin_config.telescope_config')
require('core.plugin_config.treesitter_config')
require('core.plugin_config.lsp_config')
require('core.plugin_config.luasnip_config')
-- require('core.plugin_config.neogit_config')
require('core.plugin_config.todo-comments_config')

-- Themes

require('core.plugin_config.gruvbox_config')

-- I got tired of creating separate files for each plugin configuration, so I'll
-- just put them all here. I'll try to keep it organized, though.

require('mini.surround').setup()
