local telescope = require('telescope')
telescope.setup {
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            width = 0.6,
            height = 0.8,
        },
        path_display = { "smart" }
    },
    pickers = {
        oldfiles = {
            cwd_only = true,
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-o>', builtin.find_files, {})
vim.keymap.set('n', '<A-e>', builtin.oldfiles, {})
vim.keymap.set('n', '<A-S-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>c', builtin.command_history, {})
vim.keymap.set('n', '<leader>,', builtin.commands, {})
