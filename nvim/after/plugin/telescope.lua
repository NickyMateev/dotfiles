local telescope = require('telescope')
telescope.setup {
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            width = 0.6,
            height = 0.6,
            preview_height = 0.65,
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>c', builtin.command_history, {})
vim.keymap.set('n', '<leader>,', builtin.commands, {})
