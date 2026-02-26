-- global
vim.api.nvim_set_keymap("", " ", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- movement
vim.keymap.set({ "n", "v" }, "<C-j>", "6jzz", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-k>", "6kzz", { noremap = true, silent = true })
vim.keymap.set("n", "{", "<Nop>", { noremap = true })
vim.keymap.set("n", "{", "<Nop>", { noremap = true })

-- actions
vim.keymap.set("v", "<leader>y", '"*y', { noremap = true, silent = true })
vim.keymap.set({ "v", "n" }, "<leader>n", ':noh<CR>', { noremap = true, silent = true })
vim.keymap.set({ "v", "n", "i" }, "<C-x>", ':bw!<CR>', { noremap = true, silent = true })


-- input
vim.api.nvim_set_keymap('i', '{<CR><CR>', '{<CR>}<Esc>ko', { noremap = true })
vim.api.nvim_set_keymap('i', '""', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "''", "''<Left>", { noremap = true })


-- lsp
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>ft', vim.lsp.buf.format, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>K', vim.diagnostic.open_float, opts)
