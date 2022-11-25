" coloscheme setup "
lua << END
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        hop = true,
        barbar = true,
    },
})
END

lua require'nvim-tree'.setup {}

" Config indentation indicator "
lua << END
require("indent_blankline").setup {
    enabled = true,
    show_current_context = true,
    show_current_context_start = true,
}
END

" Setting theme for LuaLine status bar "
lua << END
require('lualine').setup {
  --options = { theme = 'gruvbox_dark' }
  --options = { theme = 'onenord' }
  options = { theme = 'catppuccin' }
}
END

" bufferline setup, make it not overlap with filetree and listen to hiding the filetree"
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:false

lua << END
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.api')

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

