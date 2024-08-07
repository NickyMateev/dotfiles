require('dap-go').setup()

require('dapui').setup({
    layouts = {
        {
            elements = { {
                id = "repl",
                size = 1
            }
            },
            position = "bottom",
            size = 15
        },
        {
            elements = { {
                id = "breakpoints",
                size = 1
            } },
            position = "left",
            size = 30
        },
        {
            elements = { {
                id = "scopes",
                size = 1
            } },
            position = "bottom",
            size = 20
        },
    },
})

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })

vim.keymap.set('n', '<A-r>', ":DapNew<CR>")
vim.keymap.set('n', '<leader><leader>', ":lua require'dap'.continue()<CR>")

vim.keymap.set('n', '<A-0>', ":lua require('dapui').close()<CR>")
vim.keymap.set('n', '<A-3>', ":lua require('dapui').toggle({ layout = 1 })<CR>")
vim.keymap.set('n', '<A-4>', ":lua require('dapui').toggle({ layout = 2 })<CR>")
vim.keymap.set('n', '<A-5>', ":lua require('dapui').toggle({ layout = 3 })<CR>")
vim.keymap.set('n', '<A-9>', ":DapToggleRepl<CR>")

vim.keymap.set('n', '<leader>dh', ":lua require'dap'.toggle_breakpoint()<CR>")

vim.keymap.set('n', '<S-k>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<S-l>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<S-j>', ":lua require'dap'.step_over()<CR>")

vim.keymap.set('n', '<leader>de', ":lua require'dap'.set_exception_breakpoints({\"all\"})<CR>")

vim.keymap.set('n', '<leader>di', ":lua require'dap.ui.widgets'.hover()<CR>")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dap-float",
    callback = function()
        vim.keymap.set({ "n", "v" }, "q", "<cmd>close!<CR>")
    end,
})
