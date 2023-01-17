source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/ui.vim

lua require("telescope").setup()
lua require'hop'.setup()

lua require('neoclip').setup()
:lua require('telescope').load_extension('neoclip')

lua require('git-conflict').setup()

lua require('nvim-autopairs').setup {}

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
