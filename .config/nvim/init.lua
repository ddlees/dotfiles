---@diagnostic disable: missing-parameter
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    vim.g.mapleader = ' '
    require('options')

    use 'wbthomason/packer.nvim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = require('config.nvim-tree')
    }
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = require('config.coc')
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = require('config.gitsigns')
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = require('config.lualine')
    }
    use {
        'folke/tokyonight.nvim',
        config = require('config.tokyonight')
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = require('config.nvim-treesitter')
    }
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim',
            'fannheyward/telescope-coc.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            },
        },
        config = require('config.telescope')
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = require('config.indent_blankline')
    }
    use {
        'petertriho/nvim-scrollbar',
        config = require('config.scrollbar')
    }
    use {
        'numToStr/Comment.nvim',
        config = require('config.comment')
    }
    use {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }
    use 'editorconfig/editorconfig-vim'
    use {
        'IndianBoy42/tree-sitter-just',
        config = function()
            require('tree-sitter-just').setup({})
        end
    }
    use 'tpope/vim-fugitive'
    use 'fladson/vim-kitty'


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
