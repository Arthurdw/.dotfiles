fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun! FormatDocument()
    call TrimWhitespace()

    " Special formatting commands
    if &filetype =~ 'rust'
        :%! rustfmt --edition 2021
        return
    endif
    lua vim.lsp.buf.formatting_sync()
endfun

augroup FMT
    autocmd!
    autocmd BufWritePre * call FormatDocument()
augroup END
