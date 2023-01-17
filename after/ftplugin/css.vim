set tabstop=2
set shiftwidth=2

"setlocal tabstop=4
"setlocal shiftwidth=4

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
