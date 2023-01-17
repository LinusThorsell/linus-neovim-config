lua require'hop'.setup()

" Shortcut to use HopWord basic usage "
:nnoremap <C-h> <Cmd>HopWord<CR>

" Jump to implementation "
:nnoremap <C-[> <Cmd>:pop<CR>

" Set tab to 4 spaces "
:set tabstop=2
:set shiftwidth=2
:set expandtab

nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>