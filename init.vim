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
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

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

" Formatting"
Plug 'sbdchd/neoformat'

" Auto pairs "
Plug 'windwp/nvim-autopairs'

" Commenting "
Plug 'tpope/vim-commentary'

" my own pytest plugin "
Plug '/home/linus/Documents/personal-projects/nvim-plugins/nvim-pytest'

call plug#end()


if exists('g:vscode')
    " VSCode extension
    source $HOME/.config/nvim/init_vscode.vim
else
    " ordinary Neovim
    source $HOME/.config/nvim/init_nvim.vim
endif

