setlocal shiftwidth=2
setlocal tabstop=2

"setlocal shiftwidth=4
"setlocal tabstop=4

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
