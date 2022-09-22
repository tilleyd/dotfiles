-- Configures lsp and autocompletion.

local servers = {
    'clangd', -- C/C++
    'jedi_language_server', -- Python
}

-- add cmp's additional capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- enable language servers with additional capabilities
local lspconfig = require('lspconfig')
for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

-- set completeopt for a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- set up luasnip
local luasnip = require('luasnip')

-- set up nvim-cmp
local cmp = require('cmp')
cmp.setup {

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-3),
        ['<C-f>'] = cmp.mapping.scroll_docs(3),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }
    },

    sources = {
        { name = 'nvim_lsp' }
    }
}
