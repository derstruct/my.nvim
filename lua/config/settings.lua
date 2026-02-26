vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.incsearch = true
vim.opt.backup = false
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.diagnostic.config({
    signs = true,
    update_in_insert = true,
})

