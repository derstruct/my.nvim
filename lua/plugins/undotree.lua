return {
    'mbbill/undotree',
    config = function ()
        vim.keymap.set({ 'n', 'v' }, '<leader>u', vim.cmd.UndotreeToggle)
    end
}

