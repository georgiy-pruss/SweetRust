# SweetRust
Making Rust sweet (and more powerful) — now Python (CoffeeScript, Nim, Occam, Yaml) people can use it too

This adds indention blocks to Rust, the same way they exist in Python -- when you end a line with a colon, it means you start a block, that ends when the indention comes back to that level.

1) Copy srs.bat and SweetRust.exe (build it form SweetRust.rs) to your bin directory (mine is D:\BIN);

2) Run these commands to associate the srs extension:

    ```
    assoc .srs=SweetRust.File
    ftype SweetRust.File="C:\BIN\srs.bat" "%L" %*
    ```

3) Run rustsrs.reg to set the icon to srs files;

4) Copy srs.vim to a vim vimfiles directory, add this to your vim rc file:

    ```
    autocmd BufNewFile,BufRead *.rs map <F5> :w<CR>:!rustc <C-R>=expand("%:t")<CR><CR><CR>
    autocmd BufNewFile,BufRead *.srs map <F5> :w<CR>:!srs.bat <C-R>=expand("%:t")<CR><CR><CR>|
      \ imap <F5> <ESC>:w<CR>:!srs.bat <C-R>=expand("%:t")<CR><CR>
    autocmd BufNewFile,BufRead *.toml map <F5> :w<CR>:!cargo build <C-R>=expand("%:t")<CR><CR><CR>
    ```

Now you can compile and run srs file:

    ► hello_world.srs

Compile with optimization and run:

    ► hello_world.srs -O
