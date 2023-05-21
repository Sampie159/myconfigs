local har_mark = require('harpoon.mark')
local har_ui = require('harpoon.ui')

vim.keymap.set("n", ";a", har_mark.add_file)
vim.keymap.set("n", "<S-e>", har_ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() har_ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() har_ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() har_ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() har_ui.nav_file(4) end)
