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
"Plug 'morhetz/gruvbox'
"Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

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

" Terminal in editor "
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Markdown live preview "
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Latex support "
Plug 'lervag/vimtex'

" Copilot "
Plug 'github/copilot.vim'

" better code folding "
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'

" Clipboard : Telescope neoclip "
Plug 'AckslD/nvim-neoclip.lua'

" Git integration "
Plug 'akinsho/git-conflict.nvim'

" my own pytest plugin "
Plug '/home/linus/Documents/personal-projects/nvim-plugins/nvim-pytest'

call plug#end()

source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/ui.vim

lua require("telescope").setup()
lua require'hop'.setup()

lua require('neoclip').setup()
:lua require('telescope').load_extension('neoclip')

lua require('git-conflict').setup()

lua << END
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
END

" WIP "
