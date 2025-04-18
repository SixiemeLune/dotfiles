-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({ 
        'catppuccin/nvim',
        as = 'catppuccin' ,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end 
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use('mbbill/undotree') 
    use('tpope/vim-fugitive')

    use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use "unblevable/quick-scope"
    use "nvim-treesitter/nvim-treesitter-context"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use({'nvim-pack/nvim-spectre'})
    -- GIT SIGNS
    use({'lewis6991/gitsigns.nvim'})
end)
