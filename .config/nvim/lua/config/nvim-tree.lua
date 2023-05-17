return function()
    local ok, nvimTree = pcall(require, 'nvim-tree')
    if not ok then
        return
    else
        vim.g.loaded = 1
        vim.g.loaded_netrwPlugin = 1
        nvimTree.setup({
            git = {
                ignore = false,
            },
        })
        vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<cr>', { silent = true, noremap = true })
    end
end
