" Copilot needs LTS node.js "
lua vim.g.copilot_node_command = "~/.nvm/versions/node/v16.17.1/bin/node"

" Basic plugin setup calls "
lua require("mason").setup()
lua require("mason-lspconfig").setup()


" LSP/cmp setup for smart completion/documentation "
lua << END
local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities (
        vim.lsp.protocol.make_client_capabilities()
    ),
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

lspconfig.pyright.setup({})
lspconfig.quick_lint_js.setup({})
lspconfig.cssls.setup({})
lspconfig.volar.setup({})
--lspconfig.vuels.setup({})
lspconfig.html.setup({})
lspconfig.clangd.setup({})
lspconfig.tsserver.setup({})

require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        {name = 'nvim_lsp_signature_help'},
        {name = 'path'},
        -- {name = 'buffer', keyword_length = 3},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-e>'] = cmp.mapping.abort(),

    -- " Jump forwards in snippet "
    ['<C-d>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end, {'i', 's'}),
    },

    -- " Jump backwards in snippet "
    ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, {'i', 's'}),

})

END

" Config highlighting to be on by default, and enable autotag highlighting by default"
lua << END
require'nvim-treesitter.configs'.setup {
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    autotag = {
        enable = true,
    }
}
END
