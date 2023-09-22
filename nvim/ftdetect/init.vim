autocmd BufNewFile,BufRead *.h :set filetype=c
autocmd BufNewFile,BufRead *.rs,*.ml,*.zig :set colorcolumn=90
autocmd! FileType c,cpp nnoremap<buffer> <leader>is :Ouroboros<CR>
