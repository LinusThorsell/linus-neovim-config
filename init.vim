call plug#begin()

" Icons for UI "
Plug 'kyazdani42/nvim-web-devicons'
" Filetree in editor "
Plug 'kyazdani42/nvim-tree.lua'

" Dependency for Telescope "
Plug 'nvim-lua/plenary.nvim'
" Telescope file searching and live grep + more "
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Document status bar "
Plug 'nvim-lualine/lualine.nvim'

" Multiple tabs in editor "
Plug 'romgrk/barbar.nvim'

" Quickly jump to specific point in document "
Plug 'phaazon/hop.nvim'

" Syntax highlighting "
Plug 'nvim-treesitter/nvim-treesitter'

" Colorscheme plugin "
Plug 'morhetz/gruvbox'

" Show indentation in documents "
Plug 'lukas-reineke/indent-blankline.nvim'

" LSP support, smart highlighting and documentation "
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'

" LSP installer and handler "
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Snippet plugin "
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Snippets package "
Plug 'rafamadriz/friendly-snippets'

" HTML tag completion "
Plug 'windwp/nvim-ts-autotag'

call plug#end()

" Basic plugin setup calls "
lua require("mason").setup()
lua require("mason-lspconfig").setup()

lua require("telescope").setup()

lua require'nvim-tree'.setup {}

lua require'hop'.setup()

" Config indentation indicator "
lua << END
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
END

" Setting theme for LuaLine status bar "
lua << END
require('lualine').setup {
  options = { theme = 'gruvbox_dark' }
}
END

" LSP/cmp setup for smart completion/documentation "
lua << END
local lsp_defaults = {
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities (
        vim.lsp.protocol.make_client_capabilities()
    ),
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    lsp_defaults
)

lspconfig.quick_lint_js.setup({})
lspconfig.cssls.setup({})
lspconfig.volar.setup({})
lspconfig.html.setup({})

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
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2},
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        ['<C-CR>'] = cmp.mapping.abort(),
    
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

" Remapping for saving files "
inoremap <c-x><c-s> <c-\><c-o>:w<cr>
:nnoremap <C-s> <Cmd>:w<CR>

" Shortcut to use HopWord basic usage "
:nnoremap <C-h> <Cmd>HopWord<CR>

" Toggle Filetree "
:nnoremap <S-A-T> <Cmd>NvimTreeToggle<CR>
:nnoremap <S-T> <Cmd>NvimTreeFocus<CR>

" Telescope shortcuts for file search and grep "
:nnoremap <S-F> :Telescope find_files
:nnoremap <A-f> :Telescope live_grep

" Move to previous/next file"
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" " Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
" " Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
" " Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" Config highlighting to be on by default, and enable autotag highlighting by default"
lua << END
require'nvim-treesitter.configs'.setup {
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true,
    }
}
END

" bufferline setup, make it not overlap with filetree and listen to hiding the filetree"
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:false

lua << END
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

local function get_tree_size()
    return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
    bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
    bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
    bufferline_state.set_offset(0)
end)
END

" Set tab to 4 spaces "
:set tabstop=4
:set shiftwidth=4
:set expandtab

:set number

autocmd vimenter * ++nested colorscheme gruvbox
