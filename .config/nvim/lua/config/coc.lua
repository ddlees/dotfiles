return function()
    vim.g.coc_global_extensions = {
        'coc-docker',
        'coc-go',
        'coc-json',
        'coc-lightbulb',
        'coc-marketplace',
        'coc-sumneko-lua',
        'coc-tsserver',
        'coc-yaml',
        'coc-git',
    }

    local mappings = {
        [""] = { -- Normal, Visual, Select, and Operator-pending modes
        },
        n = {    -- Normal mode
            { "K",  '<CMD>lua _G.show_docs()<CR>',  { silent = true } },
            { '[g', '<Plug>(coc-diagnostic-prev)',  { noremap = false } },
            { ']g', '<Plug>(coc-diagnostic-next)',  { noremap = false } },
            { '[c', '<Plug>(coc-git-prevconflict)', { noremap = false } },
            { ']c', '<Plug>(coc-git-nextconflict)', { noremap = false } },
            { 'gb', '<Plug>(coc-cursors-word)',     { noremap = false } },
            { 'gd', '<Plug>(coc-definition)',       { noremap = false } },
            { 'gy', '<Plug>(coc-type-definition)',  { noremap = false } },
            { 'gi', '<Plug>(coc-implementation)',   { noremap = false } },
            { 'gr', '<Plug>(coc-references)',       { noremap = false } },
            { '<C-F>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-F>"',
                { expr = true, silent = true, nowait = true } },
            { '<C-B>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-B>"',
                { expr = true, silent = true, nowait = true } },
            { '<leader>f',  '<Plug>(coc-format)',              { silent = true, noremap = true } },
            { '<leader>rn', '<Plug>(coc-rename)',              { silent = true, noremap = true } },
            { '<leader>qf', '<Plug>(coc-fix-current)',         { silent = true, noremap = true } },
            { '<leader>ca', '<Plug>(coc-codeaction)',          { silent = true, nowait = true } },
            { '<leader>a',  '<Plug>(coc-codeaction-selected)', { silent = true, nowait = true } },
            { '<leader>cl', '<Plug>(coc-codelens-action)',     { silent = true, nowait = true } },

        },
        v = { -- Visual and Select modes
        },
        s = { -- Select mode
        },
        x = { -- Visual mode
            { "<leader>a", '<CMD>lua _G.show_docs()<CR>',     { silent = true } },
            { '<leader>f', '<Plug>(coc-format-selected)',     { silent = true } },
            { '<leader>a', '<Plug>(coc-codeaction-selected)', { silent = true, nowait = true } },
        },
        o = {     -- Operator-pending mode
        },
        ["!"] = { -- Insert and Command-line modes
        },
        i = {     -- Insert mode
            { "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
                { expr = true, silent = true, noremap = true } },
            { "<S-TAB>",   'coc#pum#visible() ? coc#pum#prev(1) : "<C-H>"', { expr = true } },
            { "<C-SPACE>", 'coc#refresh()',                                 { expr = true } },
            { '<C-F>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<Right>"',
                { expr = true, silent = true, nowait = true } },
            { '<C-B>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<Left>"',
                { expr = true, silent = true, nowait = true } },
            { '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
                { expr = true, noremap = true } }
        },
        l = { -- Insert, Command-line and Lang-Arg modes
        },
        c = { -- Command-line mode
        },
        t = { -- Terminal mode
        },
    }

    for mode, keyset in pairs(mappings) do
        for _, mapping in pairs(keyset) do
            local options = #mapping == 3 and table.remove(mapping) or { silent = true, noremap = true }
            local prefix, cmd = unpack(mapping)
            pcall(vim.api.nvim_set_keymap, mode, prefix, cmd, options)
        end
    end
    function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
    end

    function _G.show_docs()
        local cw = vim.fn.expand('<cword>', nil, nil)
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
            vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
            vim.fn.CocActionAsync('doHover')
        else
            vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
    end

    vim.api.nvim_create_augroup("CocGroup", {})
    -- Highlight the symbol and its references when holding the cursor.
    vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
        group = 'CocGroup',
        callback = function()
            if vim.fn.CocHasProvider('format') then
                vim.fn.CocAction('format')
            end
        end
    })
end
