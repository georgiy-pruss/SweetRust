# SweetRust
Making Rust sweet (and more powerful) — now Python (CoffeeScript, Nim, Occam, Yaml) people can use it too

This adds the possibility to use indention blocks in Rust, the same way they exist in Python -- when you end a line with a colon, it means you start a block, and that block ends when the indention comes back to initial level. In the output, the closing curly bracket will be alone on a line, except when the indentation was started with `let` (e.g. there goes an expression with match), then the block ends with `};`. Probably this should include all the cases when the line doesn't start with `if`, `for`, etc. Even better, some lexical analysis can be used -- now strings are not parsed and comments are processed in only one case -- one line comment after the colon. So this project can develop...

For input file aaa.srs, the output will be in aaa_srs.rs, which will be compiled to aaa.exe.

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

## Bugs/Issues

A block can't be started with multi-line statement/construction, like `fn foo(... /* many parameters on several lines */ ...):`.

The text is not split into tokens, so comments, strings -- they all can easily confuse the program.
