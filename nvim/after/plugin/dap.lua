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
            size = 10
        },
        {
            elements = { {
                id = "repl",
                size = 0.75
            }, {
                id = "scopes",
                size = 0.25
            } },
            position = "bottom",
            size = 10
        },
        {
            elements = { {
                id = "repl",
                size = 0.50
            }, {
                id = "scopes",
                size = 0.25
            }, {
                id = "breakpoints",
                size = 0.25
            } },
            position = "bottom",
            size = 10
        },
    },
})

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '🟢', texthl = '', linehl = '', numhl = '' })


vim.keymap.set('n', '<leader>du', ":lua require('dapui').close(); require('dapui').toggle({ layout = 1 })<CR>")
vim.keymap.set('n', '<leader>d0', ":lua require('dapui').close()<CR>")
vim.keymap.set('n', '<leader>d1', ":lua require('dapui').close(); require('dapui').toggle({ layout = 1 })<CR>")
vim.keymap.set('n', '<leader>d2', ":lua require('dapui').close(); require('dapui').toggle({ layout = 2 })<CR>")
vim.keymap.set('n', '<leader>d3', ":lua require('dapui').close(); require('dapui').toggle({ layout = 3 })<CR>")

vim.keymap.set('n', '<leader>dh', ":lua require'dap'.toggle_breakpoint()<CR>")

vim.keymap.set('n', '<S-k>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<S-l>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<S-j>', ":lua require'dap'.step_over()<CR>")

vim.keymap.set('n', '<leader>ds', ":lua require'dap'.stop()<CR>")
vim.keymap.set('n', '<leader>dn', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<leader>dr', ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l")
vim.keymap.set('n', '<leader>de', ":lua require'dap'.set_exception_breakpoints({\"all\"})<CR>")

vim.keymap.set('n', '<leader>di', ":lua require'dap.ui.widgets'.hover()<CR>")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dap-float",
    callback = function()
        vim.keymap.set({ "n", "v" }, "q", "<cmd>close!<CR>")
    end,
})
