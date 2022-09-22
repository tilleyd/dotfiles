-- Declares plugins using wbthomason/packer.nvim.

require('packer').startup(function()
    -- tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- colorscheme
    use 'joshdick/onedark.vim'

    -- fzf
    use 'junegunn/fzf' -- integrates the binary
    use 'junegunn/fzf.vim' -- adds useful commands

    -- which key
    use 'liuchengxu/vim-which-key'

    -- git
    use 'airblade/vim-gitgutter'
    use 'itchyny/vim-gitbranch'

    -- snippets
    use { 'L3MON4D3/LuaSnip' }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use { 'hrsh7th/nvim-cmp', branch = 'main' } -- autocompletion
    use { 'hrsh7th/cmp-nvim-lsp', branch = 'main' } -- lsp source for cmp
    use { 'saadparwaiz1/cmp_luasnip' } -- luasnip source for cmp

    -- statusline
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true}
    -- }

    -- markdown
    use { 'plasticboy/vim-markdown', requires = {{ 'godlygeek/tabular', opt = true }} }
    use 'iamcco/markdown-preview.nvim'

    -- latex
    use 'lervag/vimtex'
end)
