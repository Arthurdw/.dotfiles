fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup FMT
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
augroup END
