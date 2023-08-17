local har_mark = require('harpoon.mark')
local har_ui = require('harpoon.ui')

vim.keymap.set("n", "<leader>ha", har_mark.add_file)
vim.keymap.set("n", "<leader>hm", har_ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function() har_ui.nav_next() end)
vim.keymap.set("n", "<C-p>", function() har_ui.nav_prev() end)
