autocmd BufNewFile,BufRead *.yaml if search('{{.\+}}', 'nw') | setlocal filetype=helm | endif
