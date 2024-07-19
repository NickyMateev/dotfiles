-- ThePrimeagen
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>db", "<cmd>call db_ui#toggle()<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

-- nickymateev

-- Press jk/kj to exit from insert mode and move the cursor one character to the right
vim.keymap.set('i', 'jk', '<ESC>l')
vim.keymap.set('i', 'kj', '<ESC>l')

-- Disable the ESC key in insert mode
vim.keymap.set('i', '<ESC>', '<NOP>')

-- Disable arrow keys in all modes
vim.keymap.set('', '<Up>', '<NOP>')
vim.keymap.set('', '<Down>', '<NOP>')
vim.keymap.set('', '<Left>', '<NOP>')
vim.keymap.set('', '<Right>', '<NOP>')

-- Delete current line without leaving insert mode
vim.keymap.set('i', '<C-d>', '<esc>ddi')

-- Autoclose parentheses, brackets, and quotes
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '"', '""<Left>')

-- Yank text within double quotes
vim.keymap.set('n', 'yyy', 'vi"y')

vim.keymap.set('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Save current file with <leader>w instead of typing :w every time
vim.keymap.set('n', '<leader>w', ':w!<CR>')

-- Quit current file with <leader>q instead of typing :q every time
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- Map ,, to replay the previously used register
vim.keymap.set('n', ',,', '@@')
